# elevate_tech_assessment

A modular Flutter application following Clean Architecture principles, featuring product listing, state management with BLoC, dependency injection, and responsive UI.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Architecture

This project uses Clean Architecture with the following layers:
- **Presentation (UI):** Flutter widgets, screens, and BLoC/Cubit for state management.
- **Domain:** Business logic, use cases, and entities.
- **Data:** Data sources (remote/local), repositories, and models.

Dependency injection is handled using `get_it` and `injectable`.

## Features

- Product listing with images and details
- State management using BLoC/Cubit
- Error and loading state handling
- Responsive UI with `flutter_screenutil`
- Dependency injection for testability
- Clean, modular code structure
