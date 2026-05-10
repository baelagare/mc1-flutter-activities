# Mobile Computing 1 (Flutter) — Compilation Documentation
**Coverage:** `challenge1`, `chap6` to `chap12`  
**Note:** Use `chap8_v2/` (not `chap8/`) and `chap9_v2/` (not `chap9/`)  
**Repository:** https://github.com/baelagare/mc1-flutter-activities  
**Date compiled:** 2026-05-10  
**Author:** <Your Name>  
**Course/Section:** <Course, Section>  
**Instructor:** <Instructor Name>

---

## Table of Contents
1. [Overview](#1-overview)
2. [Tools & Environment](#2-tools--environment)
3. [How to Run Any Chapter](#3-how-to-run-any-chapter-general-steps)
4. [Activity Index (Quick Links)](#4-activity-index-quick-links)
5. [Documentation per Activity](#5-documentation-per-activity)
   - [Challenge 1](#challenge-1)
   - [Chapter 6](#chapter-6)
   - [Chapter 7](#chapter-7)
   - [Chapter 8 (v2)](#chapter-8-v2)
   - [Chapter 9 (v2)](#chapter-9-v2)
   - [Chapter 10](#chapter-10)
   - [Chapter 11](#chapter-11)
   - [Chapter 12](#chapter-12)
6. [Common Issues / Troubleshooting](#6-common-issues--troubleshooting)
7. [References](#7-references)

---

## 1) Overview
This document is a compiled documentation of hands-on Flutter activities from **Challenge 1** and **Chapters 6–12**.

### 1.1 Goals of the compilation
- Summarize what each activity teaches
- Provide clear run/build steps for each app
- Provide evidence (screenshots in your Word document)
- Note important files and key learnings per activity

### 1.2 Folder selection rules (important)
Your repository contains **multiple independent Flutter apps** (each chapter has its own `pubspec.yaml`). For this compilation, document and run the following folders:

- **Challenge 1:** `challenge1/`
- **Chapter 6:** `chap6/`
- **Chapter 7:** `chap7/`
- **Chapter 8:** `chap8_v2/` ✅ (use this)
- **Chapter 9:** `chap9_v2/` ✅ (use this)
- **Chapter 10:** `chap10/`
- **Chapter 11:** `chap11/`
- **Chapter 12:** `chap12/`

If older folders exist (e.g., `chap8/`, `chap9/`), mention them only if you want to explain why you used the v2 versions.

---

## 2) Tools & Environment
Fill this section once; it applies to all chapter apps unless a chapter requires something special.

### 2.1 System info
- OS: <Windows/macOS/Linux + version>
- CPU: <optional>
- RAM: <optional>

### 2.2 Flutter & Dart
Paste outputs:
- Flutter version: `<flutter --version>`
- Dart version: `<dart --version>`
- Channel: `<stable/beta/etc.>`

### 2.3 IDE / Editors
- IDE: <Android Studio / VS Code>
- Flutter/Dart plugin installed: <yes/no>

### 2.4 Devices used for testing
- Emulator: <model + API level>
- Physical device (optional): <model + Android/iOS version>

---

## 3) How to Run Any Chapter (General Steps)
Each chapter is its own Flutter app, so you must run commands **inside that chapter folder**.

1. Open a terminal
2. `cd` into the target folder (example: `chap6/`)
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run on an emulator/device:
   ```bash
   flutter run
   ```

### 3.1 Recommended pre-check
Run this once to confirm your environment:
```bash
flutter doctor
```

### 3.2 Optional: clean rebuild (if you hit weird build errors)
```bash
flutter clean
flutter pub get
flutter run
```

### 3.3 Optional: build APK (Android)
```bash
flutter build apk --release
```

---

## 4) Activity Index (Quick Links)
- [Challenge 1](#challenge-1)
- [Chapter 6](#chapter-6)
- [Chapter 7](#chapter-7)
- [Chapter 8 (v2)](#chapter-8-v2)
- [Chapter 9 (v2)](#chapter-9-v2)
- [Chapter 10](#chapter-10)
- [Chapter 11](#chapter-11)
- [Chapter 12](#chapter-12)

---

## 5) Documentation per Activity
> For each activity: describe the objective, what the app does, how to run it, and what screenshots you captured (you’ll paste the images into Word).

To keep your Word document clean, you can:
- Keep **short bullet explanations** in this Markdown file
- Put the **actual screenshots** only in Word
- In this Markdown file, just list the screenshot *captions* you used

---

# Challenge 1
**Folder:** `challenge1/`  
**Date completed:** <YYYY-MM-DD>

## A) Objective / Learning Outcomes
- <What requirement did Challenge 1 target?>

## B) App Description (1–3 paragraphs)
- <What the app does>
- <Main features>
- <User flow>

## C) Dependencies / Packages Used
From `pubspec.yaml`:
- <dependency 1> — <why it’s used>
- <dependency 2> — <why it’s used>

## D) How to Run
```bash
cd challenge1
flutter pub get
flutter run
```

## E) Screenshots included in Word
- Screenshot 1: <Home screen> — <what it demonstrates>
- Screenshot 2: <Feature screen> — <what it demonstrates>
- Screenshot 3: <Output/result> — <what it demonstrates>

## F) Key Implementation Notes
- Widgets used: <e.g., Scaffold, AppBar, ListView, Column>
- State management (if any): <setState / Provider / etc.>
- Navigation (if any): <Navigator.push, named routes, etc.>

## G) Challenges Encountered / Fixes
- Issue: <…>
  - Fix: <…>

## H) Reflection (5–10 sentences)
- <What you learned>

---

# Chapter 6
**Folder:** `chap6/`  
**Date completed:** <YYYY-MM-DD>

## A) Objective / Learning Outcomes
- <What Chapter 6 activity teaches>

## B) App Description
- <Short description>

## C) Dependencies / Packages Used
- <dependency> — <why>

## D) How to Run
```bash
cd chap6
flutter pub get
flutter run
```

## E) Screenshots included in Word
- Screenshot 1: <…>
- Screenshot 2: <…>

## F) Key Implementation Notes
- <Key widget/layout used>
- <Key function/logic>

## G) Reflection
- <…>

---

# Chapter 7
**Folder:** `chap7/`  
**Date completed:** <YYYY-MM-DD>

## A) Objective / Learning Outcomes
- <…>

## B) App Description
- <…>

## C) Dependencies / Packages Used
- <…>

## D) How to Run
```bash
cd chap7
flutter pub get
flutter run
```

## E) Screenshots included in Word
- Screenshot 1: <…>
- Screenshot 2: <…>

## F) Key Implementation Notes
- <…>

## G) Reflection
- <…>

---

# Chapter 8 (v2)
**Folder:** `chap8_v2/`  
**Important:** Use this folder for Chap 8 documentation.  
**Date completed:** <YYYY-MM-DD>

## A) Objective / Learning Outcomes
- <…>

## B) App Description
- <…>

## C) Why v2 is used (brief)
- <Reason you selected chap8_v2 (e.g., fixed requirements, corrected UI, bug fixes)>

## D) Dependencies / Packages Used
- <…>

## E) How to Run
```bash
cd chap8_v2
flutter pub get
flutter run
```

## F) Screenshots included in Word
- Screenshot 1: <…>
- Screenshot 2: <…>

## G) Key Implementation Notes
- <…>

## H) Reflection
- <…>

---

# Chapter 9 (v2)
**Folder:** `chap9_v2/`  
**Important:** Use this folder for Chap 9 documentation.  
**Date completed:** <YYYY-MM-DD>

## A) Objective / Learning Outcomes
- <…>

## B) App Description
- <…>

## C) Why v2 is used (brief)
- <Reason you selected chap9_v2>

## D) Dependencies / Packages Used
- <…>

## E) How to Run
```bash
cd chap9_v2
flutter pub get
flutter run
```

## F) Screenshots included in Word
- Screenshot 1: <…>
- Screenshot 2: <…>

## G) Key Implementation Notes
- <…>

## H) Reflection
- <…>

---

# Chapter 10
**Folder:** `chap10/`  
**Date completed:** <YYYY-MM-DD>

## A) Objective / Learning Outcomes
- <…>

## B) App Description
- <…>

## C) Dependencies / Packages Used
- <…>

## D) How to Run
```bash
cd chap10
flutter pub get
flutter run
```

## E) Screenshots included in Word
- Screenshot 1: <…>
- Screenshot 2: <…>

## F) Key Implementation Notes
- <…>

## G) Reflection
- <…>

---

# Chapter 11
**Folder:** `chap11/`  
**Date completed:** <YYYY-MM-DD>

## A) Objective / Learning Outcomes
- <…>

## B) App Description
- <…>

## C) Dependencies / Packages Used
- <…>

## D) How to Run
```bash
cd chap11
flutter pub get
flutter run
```

## E) Screenshots included in Word
- Screenshot 1: <…>
- Screenshot 2: <…>

## F) Key Implementation Notes
- <…>

## G) Reflection
- <…>

---

# Chapter 12
**Folder:** `chap12/`  
**Date completed:** <YYYY-MM-DD>

## A) Objective / Learning Outcomes
- <…>

## B) App Description
- <…>

## C) Dependencies / Packages Used
- <…>

## D) How to Run
```bash
cd chap12
flutter pub get
flutter run
```

## E) Screenshots included in Word
- Screenshot 1: <…>
- Screenshot 2: <…>

## F) Key Implementation Notes
- <…>

## G) Reflection
- <…>

---

## 6) Common Issues / Troubleshooting
- **Problem:** `pub get` fails / dependency conflicts  
  **Fix:** `flutter clean` → `flutter pub get` → ensure you’re on the correct Flutter channel/version.

- **Problem:** Android toolchain / licenses not accepted  
  **Fix:**
  ```bash
  flutter doctor --android-licenses
  flutter doctor
  ```

- **Problem:** No device found  
  **Fix:** Start an emulator in Android Studio / VS Code, or plug in a phone with USB debugging enabled.

- **Problem:** App builds but shows a blank screen  
  **Fix:** Check debug console logs; confirm `home:` or routes in `main.dart` are correct.

---

## 7) References
- Flutter documentation: https://docs.flutter.dev/
- Dart documentation: https://dart.dev/guides
- Course module / handouts: <add link or citation>
