# To-Do List App (SwiftUI)

A simple, clean, and beginner-friendly To-Do List application built using SwiftUI for the frontend and Firebase Firestore for backend database services.  
This app allows users to add, view, complete, and delete tasks in real-time, with optional user authentication using Firebase Auth.

## Features
- **Create and manage tasks easily.**
- **Mark tasks as completed.**
- **Delete tasks when done.**
- **Real-time data synchronization using Firebase Firestore.**
- **Smooth and intuitive SwiftUI interface.**

## Technologies Used
- **SwiftUI** — UI Framework for iOS development.
- **Firebase Firestore** — Cloud NoSQL database for storing tasks.
- **Firebase Authentication** — (Optional) for user login & signup.
- **Xcode** — IDE for iOS app development.

## How It Works
1. Users can **add** a new task through a simple form.
2. All tasks are **stored securely in Firebase Firestore**.
3. Tasks are displayed in a **real-time updating list**.
4. Users can **mark tasks as complete** or **delete them**.
5. *(Optional)* Users can **sign up/log in** to manage their own private task lists.

## Project Structure
- **ContentView.swift** — Main entry point and app navigation.
- **TaskListView.swift** — Displays the list of tasks.
- **AddTaskView.swift** — Interface to add new tasks.
- **TaskModel.swift** — Model for tasks.
- **TaskViewModel.swift** — Handles Firestore database operations.
- **LoginView.swift / RegisterView.swift** (optional) — Authentication views.

## Setup Instructions
1. Clone the repo:
   ```bash
   git clone https://github.com/SRAEYES/TASK_MANAGER.git
2. Open the .xcworkspace file in Xcode.

3. Run pod install to install Firebase dependencies.

4. Set up a Firebase project and add your GoogleService-Info.plist file.

5. Build and run the app on a simulator or device.

## Screenshot
![output](https://github.com/user-attachments/assets/1b7a15a7-f734-410e-ab9e-eff3595a48b6)


## Future Improvements
1. Add due dates and reminders.

2. Task categories or labels.

3. Push notifications.

4. Dark mode customization.


