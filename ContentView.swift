import SwiftUI

struct ContentView: View {
    @StateObject private var taskVM = TaskViewModel()
    @State private var newTaskTitle: String = ""
    @State private var selectedPriority: Priority = .medium

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                SearchBar(text: $taskVM.searchText)

                // New Task Input
                HStack {
                    TextField("Enter new task...", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Menu {
                        Picker("Priority", selection: $selectedPriority) {
                            ForEach(Priority.allCases, id: \.self) { priority in
                                Text(priority.rawValue)
                            }
                        }
                    } label: {
                        Image(systemName: "flag.fill")
                            .font(.title3)
                            .foregroundColor(priorityColor(selectedPriority))
                            .padding(.trailing)
                    }

                    Button(action: {
                        if !newTaskTitle.isEmpty {
                            taskVM.addTask(title: newTaskTitle, priority: selectedPriority)
                            newTaskTitle = ""
                            selectedPriority = .medium
                            impactFeedback()
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                }
                .padding(.top)

                // Task List
                List {
                    ForEach(taskVM.filteredTasks) { task in
                        HStack {
                            Circle()
                                .fill(priorityColor(task.priority))
                                .frame(width: 10, height: 10)

                            VStack(alignment: .leading, spacing: 4) {
                                Text(task.title)
                                    .font(.headline)
                                    .strikethrough(task.isCompleted)
                                    .foregroundColor(task.isCompleted ? .gray : .primary)

                                Text(task.createdAt, style: .date)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            if task.isCompleted {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.vertical, 6)
                        .swipeActions(edge: .leading) {
                            Button {
                                taskVM.toggleCompletion(for: task)
                                impactFeedback()
                            } label: {
                                Label("Complete", systemImage: "checkmark")
                            }
                            .tint(.green)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                taskVM.deleteTask(task: task)
                                impactFeedback()
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("📝 Task Manager")
        }
    }

    // Priority Color
    private func priorityColor(_ priority: Priority) -> Color {
        switch priority {
        case .high: return .red
        case .medium: return .orange
        case .low: return .blue
        }
    }

    // Haptic Feedback
    private func impactFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}

#Preview {
    ContentView()
}

