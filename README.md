# Flutter Tarot Learning App

A beautifully designed, JSON-powered Tarot Learning App built with Flutter and Riverpod.
This app includes Learning, Meaning, and Daily Guidance sections — all dynamically
populated using JSON files, with smooth UI and clean architecture.

## Features
- Tarot Learning Module
- Tarot Meaning Module
- Daily Guidance Section
- Light &amp; Dark Theme Toggle
- Smooth Navigation &amp; Transitions
- Content-Driven JSON Loading

## Tech Stack
- Flutter
- Riverpod State Management
- JSON Assets
- Material 3 UI



## Project Structure

```plaintext
lib/
├── main.dart
├── screens/
│ ├── main_screen.dart
│ ├── learning_screen.dart

│ ├── meaning_screen.dart
│ ├── daily_screen.dart
├── models/
│ ├── learning_item.dart
│ ├── meaning_item.dart
│ └── daily_item.dart
├── utils/
│ ├── theme_provider.dart
│ └── json_loader.dart
assets/
└── data/
├── learning.json
├── meaning.json
└── daily_content.json
```

## Getting Started
1. Clone repository
2. Install dependencies
3. Add assets to pubspec.yaml
4. Run app using flutter run

## JSON Example
```plaintext
[
{
"title": "Major Arcana",
"description":"The 22 spiritual wisdom cards.",
"icon": "arcana.png"
}
]
```

