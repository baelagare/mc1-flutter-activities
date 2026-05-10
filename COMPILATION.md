# Mobile Computing 1 (Flutter) — Compilation Documentation
**Coverage:** `challenge1`, `chap6` to `chap12`  
**Note:** Use `chap8_v2/` (not `chap8/`) and `chap9_v2/` (not `chap9/`)  
**Repository:** https://github.com/baelagare/mc1-flutter-activities  
**Date compiled:** 2026-05-10  
**Author:** **<Author Name>**  
**Course/Section:** **<Course / Section>**  
**Instructor:** **<Instructor Name>**

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
This document is a compiled technical documentation of hands-on Flutter activities from **Challenge 1** and **Chapters 6–12** (Mobile Computing 1).

### 1.1 Goals of the compilation
- Provide a consistent, chapter-by-chapter narrative of **what each activity builds** and **what concepts it practices**.
- Highlight the **key Flutter widgets/patterns** used in each chapter.
- Provide **explained code snippets** (selected, relevant excerpts — not the entire codebase).
- Provide **screenshot placeholders** that can be replaced with actual emulator/device screenshots in the final DOCX.

### 1.2 Folder selection rules (important)
This repository contains multiple independent Flutter apps (each chapter folder has its own `pubspec.yaml`). For this compilation, the included folders and order are:

1. `challenge1/`
2. `chap6/`
3. `chap7/`
4. `chap8_v2/` ✅ (use this version)
5. `chap9_v2/` ✅ (use this version)
6. `chap10/`
7. `chap11/`
8. `chap12/`

---

## 2) Tools & Environment
Fill this section once; it applies to all chapter apps unless a chapter requires something special.

### 2.1 System info
- OS: **<Windows/macOS/Linux + version>**
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

> **Screenshot policy (placeholders):** This manuscript includes screenshot placeholders (captions). Replace each placeholder with actual screenshots in the final DOCX.

---

# Challenge 1
**Folder:** `challenge1/`

## A) Objective / Purpose
Build a **multi-section dashboard-style UI** that resembles a real business app layout. The activity emphasizes **layout composition**, **custom styling**, and **navigation structure**.

## B) Key Flutter concepts covered
- `MaterialApp` configuration (`title`, `theme`, `debugShowCheckedModeBanner`)
- `Scaffold` composition: `AppBar`, `body`, `BottomNavigationBar`
- Separating UI into files (feature/widget extraction)
- Theming and color usage (`ThemeData`, custom colors)

## C) Implementation walk-through (selected code + explanation)
### C.1 App entry point and top-level widget
The app starts from `main()` and bootstraps a `MaterialApp`. The `HomePage` is the initial screen.

```dart
// challenge1/lib/main.dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Southend Contractors',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF2F4F7),
      ),
      home: const HomePage(),
    );
  }
}
```

**Explanation:**
- `debugShowCheckedModeBanner: false` removes the debug ribbon.
- `scaffoldBackgroundColor` sets a consistent off-white background for all pages.

### C.2 Home screen structure (AppBar + Body + BottomNavigationBar)

```dart
// challenge1/lib/main.dart
return Scaffold(
  appBar: AppBar(
    backgroundColor: const Color(0xFF2B78E4),
    elevation: 0,
    title: const Text('Southend Contractors', /* styling */),
    actions: [
      IconButton(
        icon: const Icon(Icons.search, color: Colors.white),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
        onPressed: () {},
      ),
    ],
  ),
  body: const BodyContent(),
  bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: const Color(0xFF2B78E4),
    items: [ /* items incl. center add button */ ],
  ),
);
```

**Explanation:**
- `BodyContent()` is imported from `body/body.dart` to keep `main.dart` smaller and to encourage modular UI.
- `BottomNavigationBarType.fixed` ensures all labels can be shown.
- A **custom circular center button** is created by wrapping an `Icon` in a styled `Container`.

## D) Notable implementation details
- The activity demonstrates a real-world app shell with:
  - Header actions (search/cart)
  - A modular page body
  - Bottom navigation with a distinct “Add” action

## E) Screenshot placeholders (replace in DOCX)
- **Screenshot C1-1:** Challenge 1 — Home screen showing AppBar + bottom navigation
- **Screenshot C1-2:** Challenge 1 — Dashboard body content (scroll position demonstrating layout)

## F) How to run
```bash
cd challenge1
flutter pub get
flutter run
```

---

# Chapter 6
**Folder:** `chap6/`

## A) Objective / Purpose
Introduce a **multi-file Flutter app structure** where the main entry sets up the theme and loads a `Home` page from `pages/home.dart`.

## B) Key Flutter concepts covered
- Minimal app bootstrap with `runApp`
- `MaterialApp` configuration
- App theming using `ThemeData(primarySwatch: ...)`
- Page separation (`lib/pages/home.dart`)

## C) Implementation walk-through (selected code + explanation)
### C.1 Bootstrap and theming

```dart
// chap6/lib/main.dart
void main() => runApp(const Chapter6App());

class Chapter6App extends StatelessWidget {
  const Chapter6App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 6 Activity',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const Home(),
    );
  }
}
```

**Explanation:**
- `Home` is imported from `pages/home.dart`, demonstrating a standard Flutter project pattern: a small `main.dart` + separate screens/widgets.
- The `primarySwatch` defines the global primary color used by many Material widgets.

## D) Notable implementation details
- This chapter’s structure is a template that scales: new pages can be added under `lib/pages/` and routed via `Navigator` or other routing.

## E) Screenshot placeholders (replace in DOCX)
- **Screenshot Ch6-1:** Chapter 6 — Home screen showing the app theme (light green)

## F) How to run
```bash
cd chap6
flutter pub get
flutter run
```

---

# Chapter 7
**Folder:** `chap7/`

## A) Objective / Purpose
Practice building a Flutter app that loads a `MyHomePage` from a separate `pages/home.dart` file and uses theme configuration via `ColorScheme.fromSeed`.

## B) Key Flutter concepts covered
- `ColorScheme.fromSeed` for theme generation
- Passing parameters into a page widget (`title`, `textAlign`)
- Modular app structure (pages + assets folder)

## C) Implementation walk-through (selected code + explanation)

```dart
// chap7/lib/main.dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chap7',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 17, 252),
        ),
      ),
      home: const MyHomePage(title: 'Home', textAlign: TextAlign.center),
    );
  }
}
```

**Explanation:**
- `ColorScheme.fromSeed(...)` generates a consistent palette from a single seed color.
- `MyHomePage(...)` demonstrates **configurable UI** (the page can behave differently depending on provided parameters).

## D) Notable implementation details
- Presence of an `assets/` folder indicates the chapter may use local images or files. If assets are used, ensure they are declared in `pubspec.yaml`.

## E) Screenshot placeholders (replace in DOCX)
- **Screenshot Ch7-1:** Chapter 7 — Home screen (center aligned text)
- **Screenshot Ch7-2:** Chapter 7 — Any screen demonstrating asset usage (if applicable)

## F) How to run
```bash
cd chap7
flutter pub get
flutter run
```

---

# Chapter 8 (v2)
**Folder:** `chap8_v2/`  
**Important:** Use this folder for Chap 8 documentation.

## A) Objective / Purpose
Demonstrate multiple **navigation and app-structure patterns** in Flutter via a single launcher screen that links to multiple mini-app/pages:
- Navigator routing
- Hero animations
- Bottom navigation
- Bottom app bar
- Tab bar
- Drawer

## B) Key Flutter concepts covered
- `Navigator.push` with `MaterialPageRoute`
- Menu/launcher pattern (one “index” screen for multiple demos)
- Common navigation UI patterns:
  - `BottomNavigationBar`
  - `BottomAppBar`
  - `TabBar`
  - `Drawer`
- Hero animations (conceptual; implemented in `pages/hero/*`)

## C) Implementation walk-through (selected code + explanation)
### C.1 Master launcher page

```dart
// chap8_v2/lib/main.dart
class MasterLauncher extends StatelessWidget {
  const MasterLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chapter 8')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nav.Home()),
            ),
            child: const Text('1. Navigator App'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => hero.Home()),
            ),
            child: const Text('2. Hero Animation App'),
          ),
          // ... more buttons
        ],
      ),
    );
  }
}
```

**Explanation:**
- This chapter uses a **hub-and-spoke** structure: one hub screen (`MasterLauncher`) pushes different demo screens.
- `Navigator.push` creates a new route on the stack, enabling back navigation.

## D) Notable implementation details
- The demo pages are organized by feature folders under `lib/pages/`:
  - `pages/navigator/`, `pages/hero/`, `pages/bottom_nav/`, etc.
- This structure is useful for teaching because each concept is isolated.

## E) Screenshot placeholders (replace in DOCX)
- **Screenshot Ch8-1:** Chapter 8 — Master launcher menu
- **Screenshot Ch8-2:** Chapter 8 — Navigator demo screen
- **Screenshot Ch8-3:** Chapter 8 — Hero animation demo (before/after transition)
- **Screenshot Ch8-4:** Chapter 8 — BottomNavigationBar demo
- **Screenshot Ch8-5:** Chapter 8 — Drawer demo

## F) How to run
```bash
cd chap8_v2
flutter pub get
flutter run
```

---

# Chapter 9 (v2)
**Folder:** `chap9_v2/`  
**Important:** Use this folder for Chap 9 documentation.

## A) Objective / Purpose
Practice building common **layout and scrolling widgets** by providing a menu that opens multiple demo pages:
- ListView
- GridView
- Stack
- Slivers

## B) Key Flutter concepts covered
- Page routing with `Navigator.push`
- Scrollable widgets:
  - `ListView`
  - `GridView`
  - `CustomScrollView` + slivers (conceptual; implemented in `pages/slivers.dart`)
- Layering widgets with `Stack`

## C) Implementation walk-through (selected code + explanation)

```dart
// chap9_v2/lib/main.dart
class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chapter 9')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListViewPage()),
            ),
            child: const Text('list view'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GridViewPage()),
            ),
            child: const Text('grid view'),
          ),
          // ... stack + slivers
        ],
      ),
    );
  }
}
```

**Explanation:**
- The menu itself is a `ListView` with buttons, which also demonstrates a simple scrollable layout.
- Each button pushes a dedicated page so each concept can be tested independently.

## D) Notable implementation details
- This chapter is well-suited for documenting **differences and best-use cases**:
  - `ListView` for linear lists
  - `GridView` for tiled content
  - `Stack` for overlays
  - Slivers for advanced scroll effects (app bars that expand/collapse, mixed scrollable sections)

## E) Screenshot placeholders (replace in DOCX)
- **Screenshot Ch9-1:** Chapter 9 — Main menu
- **Screenshot Ch9-2:** Chapter 9 — ListView demo
- **Screenshot Ch9-3:** Chapter 9 — GridView demo
- **Screenshot Ch9-4:** Chapter 9 — Stack demo (overlay visible)
- **Screenshot Ch9-5:** Chapter 9 — Slivers demo (scroll position showing sliver behavior)

## F) How to run
```bash
cd chap9_v2
flutter pub get
flutter run
```

---

# Chapter 10
**Folder:** `chap10/`

## A) Objective / Purpose
Build a “Journal Layout App” screen (as indicated by the app title) emphasizing **page layout**, **visual density**, and building a reusable home screen component.

## B) Key Flutter concepts covered
- Structuring an app with separate pages (`pages/home.dart`)
- App-level settings:
  - `debugShowCheckedModeBanner: false`
  - `visualDensity: VisualDensity.adaptivePlatformDensity`
- Using local assets (folder present)

## C) Implementation walk-through (selected code + explanation)

```dart
// chap10/lib/main.dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal Layout App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}
```

**Explanation:**
- `VisualDensity.adaptivePlatformDensity` adjusts spacing to better match the platform (mobile/desktop).
- The main UI is expected in `lib/pages/home.dart`, which is a common pattern for a dedicated home screen.

## D) Notable implementation details
- If assets are used, ensure they are declared in `pubspec.yaml` and loaded via `Image.asset(...)`.

## E) Screenshot placeholders (replace in DOCX)
- **Screenshot Ch10-1:** Chapter 10 — Home screen journal layout
- **Screenshot Ch10-2:** Chapter 10 — Any screen demonstrating asset images (if applicable)

## F) How to run
```bash
cd chap10
flutter pub get
flutter run
```

---

# Chapter 11
**Folder:** `chap11/`

## A) Objective / Purpose
Practice Flutter interactivity and gesture-driven UI via three integrated modules:
- Drag & drop gestures
- Scale/transform gestures
- Swipe-to-dismiss list items

## B) Key Flutter concepts covered
- Gesture widgets and event handling (conceptual)
- `IndexedStack` for preserving tab state
- `BottomNavigationBar` for switching between interactive demos
- Stateful UI with `setState`

## C) Implementation walk-through (selected code + explanation)
### C.1 Multi-page integration with preserved state

```dart
// chap11/lib/main.dart
class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    GesturesDragDropPage(),
    GesturesScalePage(),
    DismissiblePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.touch_app), label: 'Gestures'),
          BottomNavigationBarItem(icon: Icon(Icons.zoom_out_map), label: 'Scale & Move'),
          BottomNavigationBarItem(icon: Icon(Icons.swipe), label: 'Dismissible'),
        ],
      ),
    );
  }
}
```

**Explanation:**
- `IndexedStack` keeps the state of each page alive, which is helpful for interactive demos (gesture state, list scroll positions, etc.).
- `setState` updates `_selectedIndex` to switch visible pages.

## D) Notable implementation details
- Each module is in `lib/pages/`:
  - `gestures_drag_drop.dart`
  - `gestures_scale.dart`
  - `dismissible_list.dart`
- This separation is a good example of organizing feature demos.

## E) Screenshot placeholders (replace in DOCX)
- **Screenshot Ch11-1:** Chapter 11 — Bottom navigation with three tabs
- **Screenshot Ch11-2:** Chapter 11 — Drag & drop gesture demo
- **Screenshot Ch11-3:** Chapter 11 — Scale & move demo (zoom/transform)
- **Screenshot Ch11-4:** Chapter 11 — Dismissible list (item swiped away)

## F) How to run
```bash
cd chap11
flutter pub get
flutter run
```

---

# Chapter 12
**Folder:** `chap12/`

## A) Objective / Purpose
Build an app that loads a `Home` page from `pages/home.dart`, reinforcing **project structure** and (likely) new UI or logic introduced in Chapter 12.

> Note: The chapter `README.md` is still the default Flutter template. The purpose is inferred from structure and should be updated once `pages/home.dart` is reviewed and/or the app is run.

## B) Key Flutter concepts covered
- Standard Flutter app bootstrap (`MaterialApp` + `Home` page)
- Modularization (`lib/pages/home.dart`)

## C) Implementation walk-through (selected code + explanation)

```dart
// chap12/lib/main.dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chap12',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
```

**Explanation:**
- The initial screen is delegated to `Home()`, indicating the chapter’s logic/UI is concentrated in `lib/pages/home.dart`.

## D) Notable implementation details
- This is a typical production-like structure: keep `main.dart` as wiring, keep real UI in dedicated page files.

## E) Screenshot placeholders (replace in DOCX)
- **Screenshot Ch12-1:** Chapter 12 — Home screen
- **Screenshot Ch12-2:** Chapter 12 — Any key interaction or output screen

## F) How to run
```bash
cd chap12
flutter pub get
flutter run
```

---

## 6) Common Issues / Troubleshooting
- **Problem:** `flutter pub get` fails / dependency conflicts  
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
- Course module / handouts: **<Add link or citation>**
