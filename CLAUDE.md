# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run the app (use development flavor)
flutter run -t lib/main_development.dart

# Run production flavor
flutter run -t lib/main_production.dart

# Regenerate code (Freezed, Retrofit, json_serializable)
dart run build_runner build --delete-conflicting-outputs

# Watch and regenerate on change
dart run build_runner watch --delete-conflicting-outputs

# Analyze
flutter analyze

# Run tests
flutter test

# Run a single test file
flutter test test/widget_test.dart
```

## Architecture

The app is a Flutter medical app ("DocDoc") backed by the `vcare` API (`https://vcare.integration25.com/api/`). It uses **BLoC/Cubit** for state management, **Retrofit + Dio** for networking, **GetIt** for DI, and **Freezed** for sealed unions.

### Entry points

Two flavors exist: `lib/main_development.dart` and `lib/main_production.dart`. Both call `setupDI()`, check the user's login state via `AppPreferences`, then mount `DocApp`.

### DI (`lib/core/di/dependancy_injection.dart`)

All dependencies are registered in `setupDI()` using the global `sl` (`GetIt`) instance. Repos are `registerLazySingleton`, Cubits are `registerFactory`. When adding a new feature, register its Repo as a singleton and its Cubit as a factory here.

### Routing (`lib/core/routing/`)

`AppRouter.generateRoute` is a `switch` on `Routes.*` string constants. Adding a new screen requires:
1. A new constant in `Routes`
2. A new `case` in `AppRouter.generateRoute` that wraps the screen in `BlocProvider` (if it needs a Cubit)

The `HomeCubit` is initialized **and** `getHomeData()` is called directly in the router when navigating to `homeScreen`.

### Networking (`lib/core/networkingv2/`)

- `DioFactory` — singleton Dio with `PrettyDioLogger`. Reads the JWT from `FlutterSecureStorage` at init; call `DioFactory.setTokenIntoHeadersAfterLogin(token)` immediately after login.
- `ApiService` — global Retrofit service (login, register, logout, profile endpoints).
- Per-feature API services (`HomeApiService`) are created separately and injected alongside `ApiService`.
- `ApiResult<T>` — Freezed union: `Success(T data)` / `Failure(ApiErrorModel error)`.
- `ErrorHandler.handle(error)` — converts `DioException` types and unknown exceptions into `ApiErrorModel`. Dual error format: server may return `{ message, code, data: Map }` or a plain message string.

### Feature structure

#### Single-screen feature (e.g. `login`, `register`, `book_appointment`)

```
features/<name>/
  data/
    models/     # json_serializable models (hand-write + run build_runner)
    repos/      # Repo class — calls API service, wraps result in ApiResult<T>
    apis/       # Feature-specific Retrofit @RestApi service + generated .g.dart
  ui/
    logic/
      <name>_cubit.dart   # extends Cubit<NameState>
      <name>_state.dart   # @freezed states: initial, loading, success, error
      <name>_state.freezed.dart
    widgets/              # flat — no sub-subfolder
      <widget_a>.dart
    <name>_screen.dart
```

#### Multi-screen feature (e.g. `home`)

```
features/home/
  data/                   # shared across ALL screens in this feature
    models/
    repos/
    apis/
  ui/
    home/                 # one subfolder per screen
      logic/
        home_cubit.dart
        home_state.dart
        home_state.freezed.dart
      widgets/
        doctor_widget.dart
        doctors_speciality.dart
        ...
      home_page.dart
    nearby_doctors/
      logic/
        nearby_doctors_cubit.dart
        nearby_doctors_state.dart
        nearby_doctors_state.freezed.dart
      widgets/
        nearby_doctor_card.dart
        ...
      nearby_doctors_screen.dart
    specializations/
      widgets/
        specialization_item.dart
        ...
      specializations_screen.dart
    notifications/
      widgets/
        notifications_list.dart
        ...
      notifications_page.dart
```

**Rules:**
- `data/` belongs to the feature, not to any single screen — all screens in the feature share it.
- Every screen gets its own subfolder inside `ui/`.
- `logic/` (Cubit + State) lives inside the screen's subfolder.
- `widgets/` inside each screen's subfolder is flat — no nested sub-subfolders.
- Screens that don't fetch data independently (display-only) have no `logic/` subfolder.
- One Cubit per screen that independently calls an API. Never merge two screens' state into one Cubit.
- Cubit state uses Freezed sealed unions: `initial | loading | success(T) | error(ApiErrorModel)`.
- Register each Cubit as `registerFactory` in DI — never `registerSingleton` for a Cubit.

### Theming (`lib/core/theming/`)

- `ColorsManager` — all color constants as `static const Color`.
- `TextStyles` — all text styles using `flutter_screenutil` `.sp`/`.w`/`.h` sizing.
- `FontWeightHelper` — named font weight constants used by `TextStyles`.

Always use `ColorsManager.*` and `TextStyles.*` instead of inline values.

### Storage

- **Sensitive data** (auth token): `AppPreferences.setSecureString` / `getSecuredString` via `flutter_secure_storage`. Token key: `Constants.userToken`.
- **Non-sensitive data**: `AppPreferences.saveData` / `getString` via `shared_preferences`.

### Generated files

Never manually edit `*.g.dart` or `*.freezed.dart` files — they are produced by `build_runner`. After modifying any `@freezed`, `@JsonSerializable`, or `@RestApi` annotated class, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Assets

Asset directories (`assets/images/`, `assets/svgs/`) are registered wholesale in `pubspec.yaml` — dropping a file into either folder requires no further config.

Note: the onboarding feature directory is intentionally spelled `lib/features/onboadring/` (typo in original scaffold).
