# Task App

Task App is a responsive and adaptive Flutter application designed for both Windows and Android platforms. It enables users to create, edit, manage, and delete tasks, with offline storage using Hive and online synchronization via Firestore.

## Video
https://github.com/user-attachments/assets/b5289c4c-da5d-44a7-a91a-a0af1faa2f7a
## Features

- **Cross-Platform Support**: Available for both Android and Windows.
- **Offline Functionality**: Tasks are stored locally using Hive when there’s no internet connection.
- **Firestore Sync**: Automatically syncs tasks with Firestore when the internet connection is restored.
- **Task Management**: 
  - **Create**, **edit**, and **delete** tasks.
  - On **Android**, swipe to delete tasks using the `Dismissible` widget. Tap to **edit** tasks.
  - On **Windows**, delete tasks using tooltips and alert dialogs, and **edit** tasks easily.
- **Adaptive and Responsive Design**: Adjusts UI based on screen size and platform.

## Platforms

- **Windows**: Features desktop-specific UI, including tooltips and alert dialogs for deleting tasks, and easy task editing.
- **Android**: Mobile-specific UI with swipe-to-delete and tap-to-edit functionality.

## Usage

### Offline Mode
- Tasks are saved locally using Hive when there is no internet connection.
- Once the connection is restored, tasks will sync with Firestore automatically.

### Task Editing
- On **Android**, tap on a task to edit its details.
- On **Windows**, select the task to edit it through the app interface.

### Task Deletion
- On **Android**, swipe tasks left or right to delete them using the `Dismissible` widget.
- On **Windows**, use tooltips and alert dialogs for task deletion.

### Responsive and Adaptive
The app adjusts its layout depending on the screen size, making it user-friendly across devices.

## State Management
The app uses the **Bloc/Cubit** pattern for state management, ensuring smooth and efficient task syncing and UI updates.

## Packages Used
- `flutter_bloc`: Handles state management.
- `hive`: For local storage in offline mode.
- `cloud_firestore`: Syncs tasks to Firestore.
- `internet_connection_checker_plus`: Monitors internet connectivity.
- `firebase_core`: Provides core Firebase functionalities.
- `windows_manager`: Manages window sizes on the desktop version.



### Prerequisites


- Hive and Firestore setup
- For Android, ensure the following permission is added to the `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />


## Contributing
Contributions are welcome! Feel free to fork the repository and submit a pull request.


