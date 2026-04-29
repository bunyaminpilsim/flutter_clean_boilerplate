# Flutter Clean Architecture Boilerplate

Professional Flutter boilerplate with Clean Architecture, Riverpod state management, and comprehensive folder structure.

## 🏗️ Architecture

This project follows Clean Architecture principles with three main layers:

```
┌─────────────────────────────────────┐
│   PRESENTATION (UI)                 │
│   - Widgets, Pages, Providers       │
├─────────────────────────────────────┤
│   DOMAIN (Business Logic)           │
│   - Use Cases, Entities, Repos      │
├─────────────────────────────────────┤
│   DATA (Data Sources)               │
│   - API, Database, Local Storage    │
└─────────────────────────────────────┘
```

## 📁 Folder Structure

```
lib/
├── core/                    # Core functionality
│   ├── constants/           # App constants
│   ├── theme/              # Theme configuration
│   ├── widgets/            # Reusable widgets
│   ├── services/           # Core services
│   ├── utils/              # Utilities
│   ├── extensions/         # Dart extensions
│   ├── network/            # Network configuration
│   ├── errors/             # Error handling
│   └── router/             # App routing
│
├── shared/                 # Shared across features
│   ├── models/             # Shared models
│   └── widgets/            # Shared widgets
│
├── features/               # App features
│   └── [feature_name]/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── providers/
│           ├── pages/
│           └── widgets/
│
└── main.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK: >=3.0.0
- Dart SDK: >=3.0.0

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/flutter-clean-boilerplate.git
cd flutter-clean-boilerplate
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

## 📦 Dependencies

### State Management

- **flutter_riverpod**: ^2.4.9

### Functional Programming

- **dartz**: ^0.10.1

### Network

- **dio**: ^5.4.0

### Local Storage

- **shared_preferences**: ^2.2.2

### Routing

- **go_router**: ^13.0.0

### Utilities

- **intl**: ^0.19.0
- **equatable**: ^2.0.5

## 🎯 Features

- ✅ Clean Architecture
- ✅ Riverpod State Management
- ✅ Dio HTTP Client
- ✅ Error Handling
- ✅ Custom Widgets
- ✅ Theme Support (Light/Dark)
- ✅ Routing with GoRouter
- ✅ Local Storage
- ✅ Form Validation
- ✅ Extensions
- ✅ Network Layer

## 📝 Usage

### Creating a New Feature

1. Create feature folder structure:

```bash
mkdir -p lib/features/my_feature/{data/{datasources,models,repositories},domain/{entities,repositories,usecases},presentation/{providers,pages,widgets}}
```

2. Implement layers:
   - **Data Layer**: API calls, models, repository implementation
   - **Domain Layer**: Entities, use cases, repository interfaces
   - **Presentation Layer**: UI, providers, state management

### Example: Auth Feature

See `lib/features/example/` for a complete example implementation.

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 🔧 Configuration

### API Configuration

Edit `lib/core/constants/api_constants.dart`:

```dart
static const String baseUrl = 'https://your-api.com';
```

### Theme Customization

Edit `lib/core/theme/app_colors.dart` and `lib/core/theme/app_theme.dart`

## 📚 Documentation

- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Riverpod Documentation](https://riverpod.dev/)
- [Flutter Documentation](https://flutter.dev/docs)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

Bünyamin Pilsim - [@bunyaminpilsim](https://github.com/bunyaminpilsim)

## 🙏 Acknowledgments

- Clean Architecture by Robert C. Martin
- Riverpod by Remi Rousselet
- Flutter Team

---

Made with ❤️ using Flutter
