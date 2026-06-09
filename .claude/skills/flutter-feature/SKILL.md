# Skill: flutter-feature

Scaffold a complete new Flutter feature in this project following the DocDoc architecture: model → API service → repo → cubit/state → screen → DI → router.

## Trigger

Use when the user says "create a feature", "scaffold a feature", "add a new screen/feature", or invokes `/flutter-feature`.

## Step 0 — Gather requirements

Use `AskUserQuestion` to collect:

1. **Feature name** — PascalCase (e.g. `Appointments`). All generated names derive from this.
2. **API endpoint** — relative path (e.g. `appointments/index`). If unknown, ask.
3. **HTTP method** — GET, POST, etc. Default GET.
4. **Does it need a Cubit + BLoC state?** — Yes for data-fetching screens, No for simple static screens.
5. **Request body?** — If POST/PUT, what fields? (can be described in plain English)

Derived names (never ask, always compute):
- `featureName` = PascalCase input (e.g. `Appointments`)
- `featureNameLower` = camelCase (e.g. `appointments`)
- `featureNameSnake` = snake_case (e.g. `appointments`)
- `routeConst` = camelCase + `Screen` (e.g. `appointmentsScreen`)
- `dirPath` = `lib/features/appointments/`

## Step 1 — Create directory structure

Create all directories upfront (do not create files yet):

```
lib/features/{featureNameSnake}/
  data/
    models/
    apis/
    repos/
  ui/
    logic/
    widgets/
      {featureNameSnake}_widgets/
```

## Step 2 — Create the Response Model

File: `lib/features/{featureNameSnake}/data/models/{featureNameSnake}_response_model.dart`

Pattern (adapt fields to the feature):
```dart
import 'package:json_annotation/json_annotation.dart';
part '{featureNameSnake}_response_model.g.dart';

@JsonSerializable()
class {FeatureName}ResponseModel {
  // Add fields based on the API response shape described by the user.
  // Use @JsonKey(name: 'api_field') for snake_case → camelCase mapping.
  // Wrap list fields as List<ItemModel?>? for nullable safety.

  const {FeatureName}ResponseModel();

  factory {FeatureName}ResponseModel.fromJson(Map<String, dynamic> json) =>
      _${FeatureName}ResponseModelFromJson(json);
}
```

If the user described nested objects, create one `@JsonSerializable` class per object in the same file.

**Do NOT manually write the `.g.dart` file** — it is generated in Step 6.

## Step 3 — Create the Retrofit API service

File: `lib/features/{featureNameSnake}/data/apis/{featureNameSnake}_api_service.dart`

Inline the endpoint string directly in the annotation — no separate constants file. `ApiConstents` in core is only for `apiBaseUrl` and auth endpoints.

```dart
import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networkingv2/api_constents.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/data/models/{featureNameSnake}_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part '{featureNameSnake}_api_service.g.dart';

@RestApi(baseUrl: ApiConstents.apiBaseUrl)
abstract class {FeatureName}ApiService {
  factory {FeatureName}ApiService(Dio dio, {String baseUrl}) = _{FeatureName}ApiService;

  @GET('{api/endpoint/path}')
  Future<{FeatureName}ResponseModel> get{FeatureName}Data();
}
```

For POST with a body, use `@POST('{endpoint}')` and add `@Body() {RequestModel} body` parameter.

**Do NOT manually write the `.g.dart` file** — it is generated in Step 6.

## Step 4 — Create the Repo

File: `lib/features/{featureNameSnake}/data/repos/{featureNameSnake}_repo.dart`

```dart
import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/data/apis/{featureNameSnake}_api_service.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/data/models/{featureNameSnake}_response_model.dart';

class {FeatureName}Repo {
  final {FeatureName}ApiService {featureNameLower}ApiService;
  const {FeatureName}Repo({required this.{featureNameLower}ApiService});

  Future<ApiResult<{FeatureName}ResponseModel>> get{FeatureName}Data() async {
    try {
      final {FeatureName}ResponseModel response =
          await {featureNameLower}ApiService.get{FeatureName}Data();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
```

## Step 5 — Create the Freezed State

File: `lib/features/{featureNameSnake}/ui/logic/{featureNameSnake}_state.dart`

```dart
import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part '{featureNameSnake}_state.freezed.dart';

@freezed
class {FeatureName}State<{FeatureName}ResponseModel>
    with _${FeatureName}State<{FeatureName}ResponseModel> {
  const factory {FeatureName}State.initial() = _Initial<{FeatureName}ResponseModel>;
  const factory {FeatureName}State.loading() = Loading;
  const factory {FeatureName}State.success({FeatureName}ResponseModel response) =
      Success<{FeatureName}ResponseModel>;
  const factory {FeatureName}State.error(ApiErrorModel error) = Error;
}
```

**Do NOT manually write the `.freezed.dart` file** — it is generated in Step 8.

## Step 6 — Create the Cubit

File: `lib/features/{featureNameSnake}/ui/logic/{featureNameSnake}_cubit.dart`

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/data/models/{featureNameSnake}_response_model.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/data/repos/{featureNameSnake}_repo.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/ui/logic/{featureNameSnake}_state.dart';

class {FeatureName}Cubit extends Cubit<{FeatureName}State> {
  final {FeatureName}Repo {featureNameLower}Repo;
  {FeatureName}Cubit({required this.{featureNameLower}Repo}) : super({FeatureName}State.initial());

  Future<void> get{FeatureName}Data() async {
    emit({FeatureName}State.loading());
    final ApiResult<{FeatureName}ResponseModel> result =
        await {featureNameLower}Repo.get{FeatureName}Data();
    result.when(
      success: ({FeatureName}ResponseModel response) =>
          emit({FeatureName}State.success(response)),
      failure: (ApiErrorModel error) => emit({FeatureName}State.error(error)),
    );
  }
}
```

## Step 7 — Run code generation

Run build_runner to generate all `.g.dart` and `.freezed.dart` files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Wait for it to complete before continuing. If it fails, read the error output and fix the annotated class before retrying.

## Step 8 — Create the Screen

File: `lib/features/{featureNameSnake}/ui/{featureNameSnake}_screen.dart`

All sizing MUST use flutter_screenutil extensions. Reference guide:
- Horizontal dimensions (width, horizontal padding/margin) → `.w`
- Vertical dimensions (height, vertical padding/margin) → `.h`
- Symmetric/radius values (border radius, icon size) → `.r`
- Font sizes → `.sp` (already handled inside `TextStyles.*` — never inline)
- `double.infinity` → no extension needed
- `verticalSpace(n)` / `horizontalSpace(n)` helpers already apply `.h`/`.w` — use them for gaps

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_message_widget.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/ui/logic/{featureNameSnake}_cubit.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/ui/logic/{featureNameSnake}_state.dart';

class {FeatureName}Screen extends StatelessWidget {
  const {FeatureName}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: BlocConsumer<{FeatureName}Cubit, {FeatureName}State>(
            listenWhen: (previous, current) => current is Error,
            listener: (context, state) {
              state.whenOrNull(
                error: (error) =>
                    AppMessageWidget(message: error.getAllMessages()),
              );
            },
            buildWhen: (previous, current) =>
                current is Loading || current is Success || current is Error,
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ),
                ),
                success: (data) {
                  // Replace with real UI — all sizing must use .w / .h / .r / .sp
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('{FeatureName}', style: TextStyles.font18SemiBold),
                      verticalSpace(16),
                      // build list/content here using data ({FeatureName}ResponseModel)
                    ],
                  );
                },
                error: (_) => const SizedBox.shrink(),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

## Step 9 — Register in DI

Edit `lib/core/di/dependancy_injection.dart`. Add imports at the top and three registrations inside `setupDI()`:

```dart
// Imports to add:
import 'package:flutter_complete_project/features/{featureNameSnake}/data/apis/{featureNameSnake}_api_service.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/data/repos/{featureNameSnake}_repo.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/ui/logic/{featureNameSnake}_cubit.dart';

// Inside setupDI(), add at the end:
// {FeatureName} Feature
sl.registerLazySingleton<{FeatureName}ApiService>(() => {FeatureName}ApiService(dio));
sl.registerLazySingleton<{FeatureName}Repo>(
  () => {FeatureName}Repo({featureNameLower}ApiService: sl<{FeatureName}ApiService>()),
);
sl.registerFactory<{FeatureName}Cubit>(
  () => {FeatureName}Cubit({featureNameLower}Repo: sl<{FeatureName}Repo>()),
);
```

## Step 10 — Register route constant

Edit `lib/core/routing/routes.dart`. Add one line:

```dart
static const String {routeConst} = '/{routeConst}';
```

## Step 11 — Register route in AppRouter

Edit `lib/core/routing/app_router.dart`. Add imports and a new `case`:

```dart
// Imports to add:
import 'package:flutter_complete_project/features/{featureNameSnake}/data/repos/{featureNameSnake}_repo.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/ui/{featureNameSnake}_screen.dart';
import 'package:flutter_complete_project/features/{featureNameSnake}/ui/logic/{featureNameSnake}_cubit.dart';

// New case inside switch (route.name):
case Routes.{routeConst}:
  return MaterialPageRoute(
    builder: (context) => BlocProvider<{FeatureName}Cubit>(
      create: (context) =>
          {FeatureName}Cubit({featureNameLower}Repo: sl<{FeatureName}Repo>())..get{FeatureName}Data(),
      child: const {FeatureName}Screen(),
    ),
  );
```

## Step 12 — Verify

1. Run `flutter analyze` — zero errors expected.
2. Confirm generated files exist: `{featureNameSnake}_response_model.g.dart`, `{featureNameSnake}_api_service.g.dart`, `{featureNameSnake}_state.freezed.dart`.
3. Navigate to the new screen via `Navigator.pushNamed(context, Routes.{routeConst})` and confirm it loads without crash.

## Rules

**Code generation**
- Never manually edit `*.g.dart` or `*.freezed.dart` — run `build_runner` instead.
- Run `build_runner` before creating the screen (Step 8) so generated types are available.

**Theming**
- Always use `ColorsManager.*` for colors — never hardcode hex values or `Colors.*`.
- Always use `TextStyles.*` for text styles — never inline `fontSize`, `fontWeight`, or `color`.

**Responsiveness — zero exceptions**
- All widths → `.w` (e.g. `16.w`, `EdgeInsets.symmetric(horizontal: 20.w)`)
- All heights → `.h` (e.g. `48.h`, `EdgeInsets.symmetric(vertical: 12.h)`)
- All radii and symmetric sizes → `.r` (e.g. `BorderRadius.circular(8.r)`, icon size `24.r`)
- All font sizes → `.sp` — already inside `TextStyles.*`, never inline
- Use `verticalSpace(n)` / `horizontalSpace(n)` helpers for gaps — they apply `.h`/`.w` internally
- `double.infinity` is exempt — no extension needed
- Never use raw `double` literals for any dimension that affects layout

**Networking**
- Always wrap API calls in `try/catch` → `ApiResult.success` / `ApiResult.failure(ErrorHandler.handle(error))`.
- Feature endpoint strings are inlined in `@GET()`/`@POST()` annotations — never added to `ApiConstents`. `ApiConstents` holds only `apiBaseUrl` and auth endpoints.

**Error display**
- Always use `AppMessageWidget` for errors — no `AlertDialog`, `SnackBar`, or `showDialog`.

**Performance — hard rules**
- `BlocBuilder`/`BlocConsumer` must wrap only the subtree that depends on cubit state — never the whole screen (static chrome like navbars/headers stays outside it). Prefer `BlocSelector` when a widget needs only a slice of the state.
- Lists of dynamic data → `ListView.builder`/`.separated` only, never `ListView(children: [...])`. Wrap each repeated item's root in a `RepaintBoundary`.
- Any `AppCachedImage` rendered at a fixed display size MUST set `memCacheWidth`/`memCacheHeight` to that size (e.g. `memCacheWidth: 110.w.round()`) — never let it decode at full network resolution.
- Use `const` constructors wherever the widget has no runtime-dependent values.
- Never commit `debugRepaintRainbowEnabled`, `debugPaintSizeEnabled`, `showPerformanceOverlay`, or similar diagnostic flags in `main_development.dart`/`main_production.dart` — they're for local, temporary profiling only.

**DI**
- ApiService → `registerLazySingleton`
- Repo → `registerLazySingleton`
- Cubit → `registerFactory`

**Simple screens (no API)**
- Skip Steps 2–7 (model, API service, repo, state, cubit, build_runner).
- Register the route in `AppRouter` without a `BlocProvider`.
