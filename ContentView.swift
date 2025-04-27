import SwiftUI

struct Task: Identifiable, Codable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    func addTask(title: String) {
        let newTask = Task(title: title, isCompleted: false)
        tasks.append(newTask)
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    func toggleCompletion(for task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}

struct ContentView: View {
    @StateObject private var taskVM = TaskViewModel()
    @State private var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button(action: {
                        if !newTaskTitle.isEmpty {
                            taskVM.addTask(title: newTaskTitle)
                            newTaskTitle = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                }
                .padding(.top)

                List {
                    ForEach(taskVM.tasks) { task in
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    taskVM.toggleCompletion(for: task)
                                }
                                .foregroundColor(task.isCompleted ? .green : .gray)

                            Text(task.title)
                                .strikethrough(task.isCompleted, color: .gray)
                                .foregroundColor(task.isCompleted ? .gray : .primary)
                        }
                    }
                    .onDelete(perform: taskVM.deleteTask)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Task Manager")
        }
    }
}

#Preview {
    ContentView()
}
