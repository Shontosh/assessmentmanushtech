
# Assessment Flutter App

This project implements a cart management system with product promotions such as WEIGHT and GWP promotions.

## Steps to Clone and Run the Project

### Prerequisites
Before you begin, ensure that you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) for development
- An Android emulator or a physical Android device connected to your machine

### Step 1: Clone the Repository
First, clone the repository to your local machine using the following command:
```bash
git clone https://github.com/<your-username>/flutter-cart-management.git
```

### Step 2: Navigate to the Project Directory
Change the directory to the project folder:
```bash
cd flutter-cart-management
```

### Step 3: Install Dependencies
Run the following command to install the required dependencies:
```bash
flutter pub get
```

### Step 4: Run the Application on an Emulator
1. **Start an Android Emulator**:
   - Open Android Studio and start an emulator. If you're using VS Code, you can also use the command palette to launch the emulator.
   
2. **Run the App**:
   Once the emulator is running, use the following command to run the app:
   ```bash
   flutter run
   ```

### Step 5: Generate APK (Optional)
To build a release APK, run the following command:
```bash
flutter build apk --release
```
The APK will be generated in the `build/app/outputs/flutter-apk/` directory.

### Troubleshooting
- If you encounter issues with running the app, ensure that the Flutter SDK is properly installed and your emulator is correctly set up.
- For Android-related issues, you can check the Android Studio logs or use the following command to diagnose issues:
  ```bash
  flutter doctor
  ```

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
