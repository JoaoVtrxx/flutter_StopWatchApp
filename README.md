# Flutter Stopwatch

A stopwatch app built with Flutter and Dart, with start/pause controls, reset and a scrollable lap-time list.

## Features

- Start, pause and reset the stopwatch.
- Record and display lap times.
- Custom interface components and a background image.

Lap records are stored in an in-memory list; the project does not implement persistent lap storage.

## Screenshots

<img src="https://github.com/JoaoVtrxx/flutter_StopWatchApp/assets/106991499/ef9a7df5-017b-4109-862e-c90d65162ad5" alt="flutter_StopWatchApp screenshot 1" width="240" />

<img src="https://github.com/JoaoVtrxx/flutter_StopWatchApp/assets/106991499/9fbe4aa4-220f-4499-914a-9c1cf30cbcdf" alt="flutter_StopWatchApp screenshot 2" width="240" />

## Android download

[Download the included APK](app-stopwatch-joao.apk). This is the existing build committed to the repository.

## Run from source

Requires Flutter with a bundled Dart SDK matching `>=3.0.6 <4.0.0`, as declared in [pubspec.yaml](pubspec.yaml). Use a compatible SDK with the checked-in dependency lockfile.

```bash
git clone https://github.com/JoaoVtrxx/flutter_StopWatchApp.git
cd flutter_StopWatchApp
flutter pub get
flutter devices
```

Connect an Android device or start an emulator, then select its ID:

```bash
flutter run -d <device-id>
```

To generate a new Android release build:

```bash
flutter build apk --release
```

The generated APK is written to `build/app/outputs/flutter-apk/app-release.apk`.

## Code map

| Path | Purpose |
| --- | --- |
| [`lib/screens/home.dart`](lib/screens/home.dart) | Main stopwatch screen |
| [`lib/widgets`](lib/widgets) | Timer display, controls and lap-list widgets |
| [`lib/models/lap_model.dart`](lib/models/lap_model.dart) | Lap data model |
| [`lib/lists/listlaps.dart`](lib/lists/listlaps.dart) | In-memory lap list |
