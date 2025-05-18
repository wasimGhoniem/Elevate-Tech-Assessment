# elevate_tech_assessment

A Flutter application that displays a grid list of products fetched from the FakeStore API. This project demonstrates clean architecture principles, efficient state management, and modern Flutter development practices.

Screenshots
![Products Grid View 1](screenshots/screenshot_1.png)
![Products Grid View 1](screenshots/screenshot_2.png)


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

 Features

Fetches and displays a list of products from the Fake Store API
Implements MVVM architecture with Cubit for state management
Repository pattern for clean data handling
Dependency Injection using GetIt and Injectable
Responsive UI design with attention to detail
Error handling and loading states
Product detail view with complete product information
Clean code with proper naming conventions and organization
Caching strategy for improved performance

    
Components:

Core: Contains application-wide utilities, dependency injection setup, and network configurations
Data: Implements the data layer with API models, repositories, and data sources
Domain: Defines the business entities and repository interfaces
Presentation: Contains UI components, screens, and state management (Cubits)

🔄 State Management
The application uses Cubit for state management:

ProductsCubit: Manages the state of the product list screen including loading, success, and error states
ProductDetailsCubit: Handles the state for individual product details

💉 Dependency Injection


Setup Instructions
Prerequisites

Flutter SDK (latest stable version)
Dart SDK (latest stable version)
Android Studio / VS Code
Git

  Installation

Clone the repository:

bashgit clone https://github.com/wasimGhoniem/Elevate-Tech-Assessment.git

Navigate to the project directory:

bashcd Elevate-Tech-Assessment

Get dependencies:

bashflutter pub get

Run the code generation for injectable:

bashflutter pub run build_runner build --delete-conflicting-outputs

Run the app:

bashflutter run

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
