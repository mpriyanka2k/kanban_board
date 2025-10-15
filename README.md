# kanbanboard

# Flutter Kanban App
A Flutter project demonstrating 
**Clean Architecture** 
**Bloc** state management 
**Firebase Authentication** and **Firestore** integration.
---
## Features
- User Registration and Login using Firebase Authentication
- Kanban Board with three columns: **To Do**, **In Progress**, and **Completed**
- Add, Update, and Delete Tasks
- Logout functionality
- State management using **Bloc**
- Clean architecture
---
## Tech Stack
- Flutter
- Bloc
- Firebase Authentication
- Cloud Firestore
- GoRouter
- GetIt
---
## Working Flow
- User Authentication
- New users register using email, and password.
- Existing users login using email and password.
- On successful login, user is redirected to the Kanban Board screen.
---
## Kanban Board
- Tasks are displayed in three columns: To Do, In Progress, and Completed.
- Users can Add a new task, Edit a task, or Delete a task.
- Tasks can be dragged and dropped between columns to update their status.
---
## State Management
- Bloc handles state for user authentication and tasks.
- Data is fetched from Firestore in real-time using streams.
---
## Logout
- User can logout using the top-right logout button.
- User is redirected to the Login screen.
---
## How to Test
- Try registering with a new email and password.
- Login with the newly registered credentials.
- After successful login you will be redirected to kanban board screen
- Add a task and check it appears in the column.
- Edit a task and ensure updates reflect in that particular column.
- Drag a task to another column and verify the status updates.
- Delete a task and ensure it disappears.
---
Author
Priyanka Malekar – Flutter Developer
 