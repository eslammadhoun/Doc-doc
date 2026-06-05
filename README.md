# DocDoc — Flutter Medical App

A Flutter medical app backed by the `vcare` API. Patients can browse doctor specializations, find nearby doctors, and book appointments.

## Tech Stack

| Concern | Library |
|---|---|
| State management | flutter_bloc / Cubit |
| Networking | Retrofit + Dio |
| Dependency injection | GetIt |
| Sealed state unions | Freezed |
| UI sizing | flutter_screenutil |
| Secure storage | flutter_secure_storage |

## System Design

<img width="800" height="500" alt="System design" src="https://github.com/user-attachments/assets/9912dd98-b986-4c26-8882-8e5bb9709eaa" />

## Project Structure

```
lib/
├── core/
│   ├── di/                  # GetIt setup — setupDI()
│   ├── helpers/             # AppPreferences, Constants, extensions, spacing
│   ├── networkingv2/        # DioFactory, ApiService, ApiResult<T>, ErrorHandler
│   ├── routing/             # AppRouter (switch on Routes.*), Routes constants
│   ├── theming/             # ColorsManager, TextStyles, FontWeightHelper
│   └── widgets/             # Shared UI atoms (AppTextButton, AppTextFormField…)
│
└── features/
    ├── auth/
    │   ├── login/
    │   │   ├── data/        # models, repos
    │   │   └── ui/
    │   │       ├── logic/   # LoginCubit, LoginState + .freezed.dart
    │   │       ├── widgets/
    │   │       └── login_screen.dart
    │   ├── register/
    │   │   ├── data/
    │   │   └── ui/
    │   │       ├── logic/   # RegisterCubit, RegisterState
    │   │       ├── widgets/
    │   │       └── register_screen.dart
    │   └── onboarding/
    │       ├── widgets/
    │       └── onboarding_screen.dart
    │
    ├── home/                # Multi-screen feature — one subfolder per screen
    │   ├── data/            # shared: HomeApiService, HomeRepo, NearbyDoctorsRepo, models
    │   └── ui/
    │       ├── home/
    │       │   ├── logic/   # HomeCubit, HomeState
    │       │   ├── widgets/
    │       │   └── home_page.dart
    │       ├── nearby_doctors/
    │       │   ├── logic/   # NearbyDoctorsCubit, NearbyDoctorsState
    │       │   ├── widgets/
    │       │   └── nearby_doctors_screen.dart
    │       ├── specializations/
    │       │   ├── widgets/
    │       │   └── specializations_screen.dart
    │       └── notifications/
    │           ├── widgets/
    │           └── notifications_page.dart
    │
    └── book_appointment/
        └── ui/
            ├── logic/       # BookAppointmentCubit, BookAppointmentState
            ├── widgets/
            └── book_appointment_screen.dart
```

## Feature Structure Rules

**Single-screen feature** — `data/` + `ui/logic/` + `ui/widgets/` + `ui/<name>_screen.dart`

**Multi-screen feature** — shared `data/` at the feature root, then each screen gets its own subfolder inside `ui/` containing its own `logic/`, `widgets/`, and screen file.

**One Cubit per screen that independently calls an API.** Screens that only display data passed as arguments have no Cubit.

## Running the App

```bash
# Development
flutter run -t lib/main_development.dart

# Production
flutter run -t lib/main_production.dart

# Regenerate Freezed / Retrofit / json_serializable
dart run build_runner build --delete-conflicting-outputs

# Analyze
flutter analyze
```
