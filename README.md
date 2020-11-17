# universal_store

In recent years, people have been doing more and more of their shopping online, which means that smaller physical stores without an online presence have been seeing less consumer traffic. This semester, we created the Universal Store app to help alleviate that problem. The Universal Store enables physical stores to display their inventory in an app. Customers can browse for particular products and can receive targeted promotions based on their shopping history. The Universal Store also serves as a shopping cart interface allowing customers to scan in-store items and checkout in the app. This makes the in-person shopping experience much more convenient, and at the same time encourages valuable customers to shop at physical stores.

## Install Guide

This install guide is taken from https://flutter.dev/docs/ with modifications for our specific project.

**macOS Pre-requisites**

Operating Systems: macOS (64-bit)
Disk Space: 2.8 GB (does not include disk space for IDE/tools).
Xcode
Tools: Flutter depends on these command-line tools being available in your environment.
- bash
- curl
- git 2.x
- mkdir
- rm
- unzip
- which

**Windows Pre-requisites**

Operating Systems: Windows 7 SP1 or later (64-bit), x86-64 based
Disk Space: 1.32 GB (does not include disk space for IDE/tools).
Android Studio
Tools: Flutter depends on these tools being available in your environment.
- Windows PowerShell 5.0 or newer (this is pre-installed with Windows 10)
- Git for Windows 2.x, with the Use Git from the Windows Command Prompt option.


**Dependent Libraries**

All dependent libraries are automatically installed when you run the project. 
- sdk: flutter
- firebase_auth: 0.16.1
- cloud_firestore: 0.13.7
- provider: 4.1.3
- flutter_spinkit: 4.1.2
- international_phone_input: 1.0.4
- flutter_barcode_scanner: 1.0.1

**Download Instructions**

1. Navigate to our repository https://github.com/michaelpropp18/universal_store
2. Download the code by clicking the green download button on github (you can either clone using the command line or download and extract the zip)

### macOS intial Setup

1. Download the latest stable release of the Flutter SDK: https://flutter.dev/docs/development/tools/sdk/releases
2. Extract the file in contained the downloaded zip
3. Move the extracted flutter folder to the same level directory as the universal_store repo
4. Add the flutter tool to your path:
```
$ export PATH="$PATH:`pwd`/flutter/bin"
```
You can also pernamently add flutter to your bash_profile document to run in all terminal sessions. 
5. Confirm flutter is working by running the following command:
```
$ flutter doctor
```
All checkmarks should be green with the exception of the emulator (if it has not been launched)

6. Run the following command to open an emulator
```
$ open -a simulator
```
Note that you need Xcode installed to run the following command.
7. Run the following command to launch our project in the emulator:
```
$ flutter run
```
We recommend visiting https://flutter.dev/docs/get-started/install/macos to troubleshoot



### Windows Initial Setup

1. Download the latest stable release of the Flutter SDK: https://flutter.dev/docs/development/tools/sdk/releases
2. Extract the file in contained the downloaded zip
3. Move the extracted flutter folder to the same level directory as the universal_store repo
4. Add the flutter tool to your path. If you wish to run Flutter commands in the regular Windows console, take these steps to add Flutter to the PATH environment variable:

- From the Start search bar, enter ‘env’ and select Edit environment variables for your account.
- Under User variables check if there is an entry called Path:
- If the entry exists, append the full path to flutter\bin using ; as a separator from existing values.
- If the entry doesn’t exist, create a new user variable named Path with the full path to flutter\bin as its value.
- You have to close and reopen any existing console windows for these changes to take effect.
You can also pernamently add flutter to your bash_profile document to run in all terminal sessions. Visit https://flutter.dev/docs/get-started/install/windows for more information
5. From a console window that has the Flutter directory in the path (see above), run the following command to see if there are any platform dependencies you need to complete the setup:
```
C:\src\flutter>flutter doctor
```
All checkmarks should be green with the exception of the emulator (if it has not been launched)

6. Download and install Android Studio https://developer.android.com/studio
7. Start Android Studio, and go through the ‘Android Studio Setup Wizard’. This installs the latest Android SDK, Android SDK Command-line Tools, and Android SDK Build-Tools, which are required by Flutter when developing for Android.
8. Open the universal_store directory in Android Studio
9. Run the app on an android emulator
- Enable VM acceleration on your machine https://developer.android.com/studio/run/emulator-acceleration
- Launch Android Studio and open the universal_store project, click the AVD Manager icon, and select Create Virtual Device. In older versions of Android Studio, you should instead launch Android Studio > Tools > Android > AVD Manager and select Create Virtual Device…. (The Android submenu is only present when inside an Android project.)
- Choose a device definition and select Next.
- Select one or more system images for the Android versions you want to emulate, and select Next. An x86 or x86_64 image is recommended.
- Under Emulated Performance, select Hardware - GLES 2.0 to enable hardware acceleration https://developer.android.com/studio/run/emulator-acceleration
- Verify the AVD configuration is correct, and select Finish.
- In Android Virtual Device Manager, click Run in the toolbar. The emulator starts up and displays the default canvas for your selected OS version and device.

We recommend visiting https://flutter.dev/docs/get-started/install/windows to troubleshoot

**macOS Build Instructions**

Follow steps 5 - 7 in the macOS set-up instructions to build.

**Windows Build Instructions**

Follow steps 7 - 9 in the windows set-up instructions to build. 


