# TASK_MANAGER
 To-Do List App (SwiftUI)

A simple, clean, and beginner-friendly To-Do List application built using SwiftUI for the frontend and Firebase Firestore for backend database services.
The app allows users to add, view, complete, and delete tasks in real-time, with optional user authentication using Firebase Auth.

Features
Create and manage tasks easily.

Mark tasks as completed.

Delete tasks when done.

Real-time data synchronization using Firebase Firestore.

Smooth and intuitive SwiftUI interface.

Technologies Used
SwiftUI — UI Framework for iOS development.

Firebase Firestore — Cloud NoSQL database for storing tasks.

Firebase Authentication — (Optional) for user login & signup.

Xcode — IDE for iOS app development.

How It Works
Users can add a new task through a simple form.

All tasks are stored securely in Firebase Firestore.

Tasks are displayed in a real-time updating list.

Users can mark tasks as complete or delete them.

(Optional) Users can sign up/log in to manage their own private task lists.

Project Structure
ContentView.swift — Main entry point and app navigation.

TaskListView.swift — Displays the list of tasks.

AddTaskView.swift — Interface to add new tasks.

TaskModel.swift — Model for tasks.

TaskViewModel.swift — Handles Firestore database operations.

LoginView.swift / RegisterView.swift (optional) — Authentication views.

Setup Instructions
Clone the repo.

Open the .xcworkspace file in Xcode.

Run pod install to install Firebase dependencies.

Set up a Firebase project and add your GoogleService-Info.plist file.

Build and run the app on a simulator or device.

Future Improvements
Add due dates and reminders.

Task categories or labels.

Push notifications.

Dark mode customization.

Author
Developed as a beginner-friendly full-stack iOS project for learning SwiftUI and Firebase integration.

