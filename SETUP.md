# Setup Guide

This document provides detailed setup instructions for the My Space project.

## Prerequisites

### Required Software

1. **Flutter SDK** (3.0 or higher)
   ```bash
   flutter --version
   # Flutter 3.0.0 or higher required
   ```
   
   Install from: https://docs.flutter.dev/get-started/install

2. **Dart SDK** (3.0 or higher)
   ```bash
   dart --version
   # Dart 3.0.0 or higher required
   ```
   
   Included with Flutter SDK

3. **Melos** (for monorepo management)
   ```bash
   dart pub global activate melos
   ```

### Platform-Specific Requirements

#### iOS Development
- macOS required
- Xcode 14.0+
- CocoaPods
  ```bash
  sudo gem install cocoapods
  ```

#### Android Development
- Android Studio or Android SDK
- Java JDK 11+
- Android SDK 21+ (minimum SDK)
- Android SDK 33+ (target SDK)

#### Web Development
- Chrome browser (for debugging)

#### Desktop Development

**macOS:**
- Xcode command line tools
- macOS 10.14+

**Windows:**
- Visual Studio 2022
- Windows 10 1809+
- "Desktop development with C++" workload

**Linux:**
- Clang
- CMake
- GTK development headers
- Ninja-build
- pkg-config
- libgtk-3-dev
- liblzma-dev

## Initial Setup

### 1. Clone Repository

```bash
git clone https://github.com/cyrax111/my-space.git
cd my-space
```

### 2. Verify Flutter Installation

```bash
flutter doctor -v
```

Fix any issues reported by Flutter Doctor before proceeding.

### 3. Install Dependencies

```bash
# Bootstrap all packages (installs dependencies for all packages)
melos bootstrap
```

This command will:
- Run `flutter pub get` for all packages
- Link local dependencies
- Verify all package configurations

### 4. Generate Code

```bash
# Generate code for freezed, json_serializable, injectable
melos run build:runner
```

This will generate:
- `*.freezed.dart` files (immutable classes)
- `*.g.dart` files (JSON serialization, DI)
- `*.config.dart` files (injectable configuration)

### 5. Verify Setup

```bash
# Analyze all packages
melos run analyze

# Run tests (will fail if setup is incomplete)
melos run test
```

## Running the App

### Choose a Platform

#### Web
```bash
cd apps/my_space
flutter run -d chrome
```

#### iOS Simulator
```bash
# List available devices
flutter devices

# Run on iOS simulator
flutter run -d iphone

# Or specify a specific simulator
flutter run -d "iPhone 14 Pro"
```

#### Android Emulator
```bash
# List available devices
flutter devices

# Run on Android emulator
flutter run -d emulator-5554

# Or use device name
flutter run -d "Pixel_7_API_33"
```

#### macOS
```bash
flutter run -d macos
```

#### Windows
```bash
flutter run -d windows
```

#### Linux
```bash
flutter run -d linux
```

## Development Workflow

### Code Generation (Watch Mode)

For active development, run code generation in watch mode:

```bash
melos run build:runner:watch
```

This will automatically regenerate files when you make changes.

### Testing

```bash
# Run all tests
melos run test

# Run unit tests only
melos run test:unit

# Run integration tests
melos run test:integration

# Run tests for specific package
cd packages/feature_blog
flutter test
```

### Code Quality

```bash
# Analyze code
melos run analyze

# Format code
melos run format

# Check formatting without changing files
melos run format -- --set-exit-if-changed
```

## IDE Setup

### Visual Studio Code

#### Recommended Extensions

1. **Flutter** - `Dart-Code.flutter`
2. **Dart** - `Dart-Code.dart-code`
3. **Flutter Widget Snippets** - `alexisvt.flutter-snippets`
4. **Error Lens** - `usernamehw.errorlens`
5. **GitLens** - `eamodio.gitlens`

#### Settings

Create `.vscode/settings.json`:

```json
{
  "dart.lineLength": 80,
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  },
  "dart.debugExternalPackageLibraries": true,
  "dart.debugSdkLibraries": false,
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.rulers": [80],
    "editor.selectionHighlight": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false
  }
}
```

#### Launch Configuration

Create `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "my_space (development)",
      "request": "launch",
      "type": "dart",
      "program": "apps/my_space/lib/main.dart",
      "args": ["--dart-define=ENV=development"]
    },
    {
      "name": "my_space (production)",
      "request": "launch",
      "type": "dart",
      "program": "apps/my_space/lib/main.dart",
      "args": ["--dart-define=ENV=production"]
    }
  ]
}
```

### Android Studio / IntelliJ IDEA

#### Plugins

1. **Flutter** (includes Dart)
2. **Flutter Enhancement Suite**
3. **Rainbow Brackets**

#### Settings

- **Editor > Code Style > Dart**: Set line length to 80
- **Editor > General > Auto Import**: Enable auto-import
- **Editor > General**: Enable "Ensure line feed at end of file"

## Troubleshooting

### Common Issues

#### 1. `melos: command not found`

```bash
# Make sure global packages are in your PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Add to your shell profile (.bashrc, .zshrc, etc.)
echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >> ~/.zshrc
```

#### 2. Build runner conflicts

```bash
# Clean and regenerate
melos run clean:deep
melos bootstrap
melos run build:runner
```

#### 3. iOS pod install fails

```bash
cd apps/my_space/ios
pod repo update
pod install
```

#### 4. Android build fails

```bash
cd apps/my_space/android
./gradlew clean
cd ../..
flutter clean
flutter pub get
```

#### 5. Web build issues

```bash
flutter clean
flutter pub get
flutter run -d chrome --web-renderer html
```

### Reset Everything

If all else fails:

```bash
# Deep clean
melos run clean:deep

# Remove all Flutter artifacts
flutter clean

# Bootstrap from scratch
melos bootstrap

# Regenerate code
melos run build:runner
```

## Environment Variables

### Development

Create `apps/my_space/.env.development`:

```env
ENV=development
API_URL=http://localhost:3000
LOG_LEVEL=debug
```

### Production

Create `apps/my_space/.env.production`:

```env
ENV=production
API_URL=https://api.example.com
LOG_LEVEL=info
```

## Building for Release

### Android

```bash
cd apps/my_space
flutter build apk --release
# APK at: build/app/outputs/flutter-apk/app-release.apk

# Or build app bundle
flutter build appbundle --release
# AAB at: build/app/outputs/bundle/release/app-release.aab
```

### iOS

```bash
cd apps/my_space
flutter build ios --release
# Open Xcode to archive and upload
open ios/Runner.xcworkspace
```

### Web

```bash
cd apps/my_space
flutter build web --release
# Output at: build/web/
```

### macOS

```bash
cd apps/my_space
flutter build macos --release
# App at: build/macos/Build/Products/Release/my_space.app
```

### Windows

```bash
cd apps/my_space
flutter build windows --release
# App at: build\windows\runner\Release\
```

### Linux

```bash
cd apps/my_space
flutter build linux --release
# App at: build/linux/x64/release/bundle/
```

## Performance Profiling

### Profile Mode

```bash
flutter run --profile
```

### DevTools

```bash
# Start DevTools
flutter pub global activate devtools
flutter pub global run devtools

# Or use the DevTools in your IDE
```

## Database Management

### Viewing SQLite Database

```bash
# iOS Simulator
open ~/Library/Developer/CoreSimulator/Devices/[DEVICE_ID]/data/Containers/Data/Application/[APP_ID]/Documents/

# Android Emulator
adb shell
run-as com.example.my_space
cd databases/
cat my_space.db
```

### Database Tools

- **DB Browser for SQLite**: https://sqlitebrowser.org/
- **TablePlus**: https://tableplus.com/

## Next Steps

After setup is complete:

1. Read [ARCHITECTURE.md](./ARCHITECTURE.md) for architecture details
2. Check [README.md](./README.md) for feature documentation
3. Review [CONTRIBUTING.md](./CONTRIBUTING.md) for contribution guidelines
4. Start coding! 🚀

## Getting Help

- **Issues**: https://github.com/cyrax111/my-space/issues
- **Discussions**: https://github.com/cyrax111/my-space/discussions
- **Telegram**: [@Cyrax111](https://t.me/Cyrax111)

---

**Happy Coding! 🦾**
