# Workbench App - Workout Tracking & Fitness Management

A comprehensive Flutter-based workout tracking application built with clean architecture principles. The app provides an intuitive interface for managing workouts, tracking exercises, and monitoring fitness progress.

## 🚀 Features

### Core Functionality
- **Workout Management**: Browse and select from available workout programs
- **Exercise Tracking**: Interactive exercise carousel with selection and completion states
- **Sets Management**: Track weight, reps, and 10RM (10 Rep Max) for each exercise
- **Edit Mode**: Drag & drop reordering, exercise deletion, and real-time modifications
- **Local Persistence**: Save workout data locally using SharedPreferences
- **Responsive Design**: Mobile-optimized UI following Figma design specifications

### User Experience
- **Pixel-Perfect Design**: Faithful implementation of Figma mockups
- **Smooth Animations**: Fluid transitions and interactive feedback
- **Custom Typography**: Manrope font family for consistent branding
- **Intuitive Navigation**: Clear visual hierarchy and user flow

## 🏗️ Architecture

### Why This Architecture?

I chose this architecture because it provides:

1. **Separation of Concerns**: Each layer has a specific responsibility
2. **Testability**: Easy to unit test individual components
3. **Maintainability**: Clear structure makes code easy to understand and modify
4. **Scalability**: Can easily add new features without affecting existing code
5. **State Management**: Clean separation between UI state and business logic

### Architecture Overview

```
lib/
├── app/                    # App configuration and dependency injection
│   ├── app.dart           # Main app setup with routes and dependencies
│   ├── app.locator.dart   # Generated dependency injection
│   └── app.router.dart    # Generated routing configuration
├── models/                 # Data models and entities
│   ├── exercise_detail.dart
│   ├── workout.dart
│   ├── workout_data.dart
│   └── workout_session.dart
├── services/              # Business logic and data services
│   ├── exercise_service.dart
│   └── workout_service.dart
└── ui/                    # Presentation layer
    ├── common/            # Shared UI components and utilities
    │   ├── app_assets.dart
    │   ├── app_colors.dart
    │   ├── app_strings.dart
    │   ├── app_text_styles.dart
    │   └── ui_helpers.dart
    └── views/             # Screen implementations
        ├── exercise_detail/
        ├── workout_list/
        └── workout_session/
            └── widgets/   # Reusable UI components
```

### Architecture Layers

#### 1. **Presentation Layer** (`ui/`)
- **Views**: Screen-level widgets that handle user interactions
- **Widgets**: Reusable UI components for better code organization
- **Common**: Shared utilities, colors, text styles, and assets

#### 2. **Business Logic Layer** (`services/`)
- **Services**: Handle business logic, data processing, and API calls
- **ViewModels**: Manage UI state and coordinate between views and services

#### 3. **Data Layer** (`models/`)
- **Models**: Data structures representing business entities
- **Local Storage**: SharedPreferences for data persistence

#### 4. **App Layer** (`app/`)
- **Dependency Injection**: Using Stacked's locator pattern
- **Routing**: Navigation configuration
- **App Setup**: Initial configuration and service registration

### State Management Strategy

I use a **hybrid approach** combining:

1. **Stacked Architecture**: For dependency injection and navigation
2. **StatefulWidget**: For local UI state (edit mode, form state)
3. **Singleton ViewModels**: For shared business logic and data persistence

**Why this approach?**
- **Local State**: Simple UI state changes don't need complex state management
- **Shared State**: Business logic and data persistence benefit from centralized management
- **Performance**: Avoids unnecessary rebuilds and state conflicts

## 🛠️ Technology Stack

- **Framework**: Flutter 3.x
- **State Management**: Stacked + StatefulWidget
- **Dependency Injection**: Stacked Locator
- **Local Storage**: SharedPreferences
- **Architecture**: Clean Architecture + MVVM
- **UI Framework**: Material Design 3

## 📱 Screenshots

### Workout List
Browse available workout programs with clean, organized interface.

### Workout Session
Main workout tracking interface with:
- Exercise carousel with selection states
- Detailed exercise information panel
- Sets management table
- Edit mode for customization

### Exercise Detail
Comprehensive exercise information including:
- Exercise instructions and form tips
- Muscle group targeting
- Equipment requirements
- Progress tracking

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.3 or higher)
- Dart SDK (3.0.3 or higher)
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/YohannesTesfaye21/workbench_app.git
   cd workbench_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (if needed)
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Development Setup

1. **Code Generation**
   - The app uses Stacked for dependency injection and routing
   - Run `flutter packages pub run build_runner build` after modifying:
     - `app.dart` (routes, dependencies, bottom sheets, dialogs)
     - Any `@StackedApp` annotations

2. **Hot Reload**
   ```bash
   flutter run --hot
   ```

3. **Build for Production**
   ```bash
   # Android
   flutter build apk --release
   
   # iOS
   flutter build ios --release
   ```

## 📁 Project Structure

### Key Files

- **`lib/main.dart`**: App entry point
- **`lib/app/app.dart`**: App configuration, routes, and dependencies
- **`lib/ui/views/workout_session/`**: Main workout tracking functionality
- **`lib/models/`**: Data models and entities
- **`lib/services/`**: Business logic and data services

### Widget Organization

The workout session is broken down into modular widgets:

- **`WorkoutHeader`**: Top navigation and timer
- **`ExerciseCarousel`**: Horizontal exercise list
- **`ExerciseDetailsPanel`**: Exercise information and actions
- **`SetsSection`**: Sets management table
- **`EditModeActions`**: Discard/Save buttons
- **`ActionButtons`**: Instructions, Warm-up, FAQ buttons

## 🔧 Configuration

### Dependencies

Key dependencies in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  stacked: ^3.4.0              # State management and DI
  stacked_services: ^1.1.0     # Navigation, dialogs, bottom sheets
  shared_preferences: ^2.2.2   # Local data persistence
```

### Environment Setup

- **Flutter Version**: 3.0.3+
- **Dart Version**: 3.0.3+
- **Target Platforms**: Android, iOS, Web, Desktop

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/viewmodels/workout_session_viewmodel_test.dart

# Run with coverage
flutter test --coverage
```

### Test Structure

- **Unit Tests**: ViewModel logic and business rules
- **Widget Tests**: UI component behavior
- **Integration Tests**: End-to-end user flows

## 🚀 Deployment

### Android

1. **Generate signed APK**
   ```bash
   flutter build apk --release
   ```

2. **Generate App Bundle**
   ```bash
   flutter build appbundle --release
   ```

### iOS

1. **Build for iOS**
   ```bash
   flutter build ios --release
   ```

2. **Archive in Xcode**
   - Open `ios/Runner.xcworkspace` in Xcode
   - Product → Archive
   - Upload to App Store Connect

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style

- Follow Flutter/Dart style guidelines
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions small and focused
- Use `const` constructors where possible

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Yohannes Tesfaye**
- GitHub: [@YohannesTesfaye21](https://github.com/YohannesTesfaye21)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Stacked team for the excellent architecture package
- Figma community for design inspiration
- Open source contributors

---

## 📞 Support

If you have any questions or need help getting started, please:

1. Check the [Issues](https://github.com/YohannesTesfaye21/workbench_app/issues) page
2. Create a new issue with detailed description
3. Contact the maintainer

**Happy Coding! 🚀**