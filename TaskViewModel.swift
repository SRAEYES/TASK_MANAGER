import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var searchText: String = ""

    private var db = Firestore.firestore()

    init() {
        fetchTasks()
    }

    var filteredTasks: [Task] {
        if searchText.isEmpty {
            return tasks
        } else {
            return tasks.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }

    func fetchTasks() {
        db.collection("tasks")
            .order(by: "createdAt", descending: false)
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.tasks = documents.compactMap { try? $0.data(as: Task.self) }
            }
    }

    func addTask(title: String, priority: Priority) {
        let newTask = Task(title: title, isCompleted: false, createdAt: Date(), priority: priority)
        do {
            _ = try db.collection("tasks").addDocument(from: newTask)
        } catch {
            print("Error adding task: \(error.localizedDescription)")
        }
    }

    func deleteTask(task: Task) {
        if let taskId = task.id {
            db.collection("tasks").document(taskId).delete()
        }
    }

    func toggleCompletion(for task: Task) {
        if let taskId = task.id {
            db.collection("tasks").document(taskId).updateData(["isCompleted": !task.isCompleted])
        }
    }
}

