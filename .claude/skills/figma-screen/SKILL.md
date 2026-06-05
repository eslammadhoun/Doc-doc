# Skill: figma-screen

Implement a Flutter screen from a Figma design URL, following the full DocDoc project architecture: Figma inspection → optional Cubit/State scaffold → widget-separated screen → route registration.

## Trigger

Use when the user shares a Figma URL and asks to implement, build, or create a screen. Also triggered by `/figma-screen`.

---

## Step 0 — Gather requirements

Use `AskUserQuestion` to collect **all four** before doing any work:

1. **Figma design URL** — full `figma.com/design/...` URL with `node-id` parameter.
2. **Screen name** — PascalCase (e.g. `DoctorProfile`). All derived names come from this.
3. **Location** — one of:
   - `new` — create a brand-new feature folder.
   - `existing:<featureName>` — add a screen inside an already existing feature (e.g. `existing:book_appointment`).
4. **Does this screen need its own Cubit?**
   - `yes` — scaffold a new Cubit + State (UI-only, no API). If the screen will later need API data, skip the data layer for now — the user will wire it separately.
   - `no` — ask a follow-up question (see Step 0b below).

## Step 0b — Follow-up when user says "no" to a new Cubit

Use `AskUserQuestion` with two options:

- **Link to an existing Cubit** — the screen should be wrapped in a `BlocProvider` / `BlocConsumer` pointing to an already existing Cubit in the project. Ask the user: *"Which existing Cubit should this screen be linked to?"* (e.g. `HomeCubit`, `BookAppointmentCubit`). Record the answer as `linkedCubit`.
- **Pure UI** — no BLoC at all. The screen is a plain `StatelessWidget`. Register in the router without any `BlocProvider`.

If the user picks **Link to an existing Cubit**, scan `lib/features/` to locate the Cubit's import path and state class name before writing any code, so the screen uses the correct types.

Set `cubitsMode` to one of: `new` | `linked:<CubitClassName>` | `none`.

---

## Derived names (never ask, always compute from the PascalCase screen name)
- `ScreenName` = PascalCase (e.g. `DoctorProfile`)
- `screenNameCamel` = camelCase (e.g. `doctorProfile`)
- `screenNameSnake` = snake_case (e.g. `doctor_profile`)
- `routeConst` = camelCase + `Screen` (e.g. `doctorProfileScreen`)
- `featureDir` = if new → `lib/features/{screenNameSnake}/` ; if existing → existing feature path

---

## Step 1 — Inspect the Figma design

Load the Figma MCP tool schema first, then call `get_design_context` with the parsed `fileKey` and `nodeId`.

**URL parsing:**
- `figma.com/design/:fileKey/:title?node-id=:nodeId` — replace `-` with `:` in `nodeId`.
- Example: `node-id=1-6429` → `nodeId = "1:6429"`.

Call:
```
mcp__figma__get_design_context(fileKey: "...", nodeId: "...", depth: 5)
```

From the response, extract and document:
- Overall layout structure (Scaffold shape, scroll behaviour, fixed header/footer)
- Every visual section and its children (names, types, content)
- Colors used — map each to the nearest `ColorsManager.*` constant. If no match exists, add a new `static const Color` to `ColorsManager` and use that token everywhere.
- Typography — map each text style to the nearest `TextStyles.*`. If no match exists, add a new style to `TextStyles` following the existing naming pattern `font{size}{Weight}{Color}` and use that token everywhere.
- Spacing values (gaps, padding) — convert to `.w` / `.h` / `.r` using `flutter_screenutil`.
- Assets (images, icons, SVGs) — note filenames and whether they already exist under `assets/`.
- Interactive elements (buttons, tabs, inputs, toggles).

> **Colour and style rules — enforced:**
> - NEVER hardcode `Color(0xff...)`, `Colors.*` (except `Colors.white`/`Colors.transparent` as last resort if no token fits), or raw `TextStyle(...)` inline in widgets.
> - ALWAYS use `ColorsManager.*` and `TextStyles.*`.
> - If a needed token is missing, add it to the source file first, then use it.

---

## Step 2 — Plan the widget tree

Before writing any code, outline (in a code comment or mental model):

```
{ScreenName}Screen          ← root, StatelessWidget, Scaffold + SafeArea(bottom:false)
  ├─ {ScreenName}Navbar      ← back button + title (if design has one)
  ├─ {SectionA}Section       ← one widget per logical visual block
  │    └─ {ItemA}Card / {ItemA}Tile  ← one widget per repeated item
  ├─ {SectionB}Section
  └─ {ScreenName}BottomBar   ← fixed CTA / bottom nav (if present)
```

Rules:
- Every named visual section → its own private `StatelessWidget` file.
- Any widget rendered in a list/loop → its own file.
- Shared atoms (Avatar, Badge, RatingStars) that already exist in `lib/core/widgets/` → reuse, don't recreate.
- The root screen file only imports its direct section-level children — no deep widget tree in one file.

---

## Step 3 — (Conditional) Scaffold or link Cubit

Act based on `cubitsMode`:

### cubitsMode = `new` — create a fresh UI-only Cubit

File: `lib/features/{featureDir}/ui/logic/{screenNameSnake}_cubit.dart`
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/{featureDir}/ui/logic/{screenNameSnake}_state.dart';

class {ScreenName}Cubit extends Cubit<{ScreenName}State> {
  {ScreenName}Cubit() : super(const {ScreenName}State());

  // Add UI interaction methods here as needed
}
```

File: `lib/features/{featureDir}/ui/logic/{screenNameSnake}_state.dart`
```dart
import 'package:flutter/foundation.dart';

@immutable
class {ScreenName}State {
  // Add UI state fields here (e.g. selectedTab, isExpanded)
  const {ScreenName}State();

  {ScreenName}State copyWith() {
    return const {ScreenName}State();
  }
}
```

> Plain Dart class with `@immutable` + `copyWith`. NOT Freezed — Freezed is reserved for async API states only.

Register in `lib/core/di/dependancy_injection.dart`:
```dart
sl.registerFactory<{ScreenName}Cubit>(() => {ScreenName}Cubit());
```

### cubitsMode = `linked:<CubitClassName>` — reuse an existing Cubit

- Do NOT create any new Cubit or State file.
- Import the existing Cubit and its State from wherever they live in `lib/features/`.
- Use `BlocBuilder` / `BlocConsumer` with the existing types inside widgets that need to react to state.
- The screen's router case wraps it in `BlocProvider<LinkedCubit>` using `sl<LinkedCubit>()` (see Step 9).

### cubitsMode = `none` — pure UI, no BLoC

- Do NOT create or import any Cubit or State.
- Screen is a plain `StatelessWidget`.
- No `BlocProvider`, `BlocBuilder`, or `BlocConsumer` anywhere in the screen or its widgets.

---

## Step 4 — Add missing ColorsManager tokens

If Step 1 identified any colour that has no matching `ColorsManager.*` constant, edit `lib/core/theming/colors.dart` now:

```dart
static const Color {tokenName} = Color(0xff{hex});
```

Name the token descriptively: `primaryPurple`, `warningAmber`, `cardBorderGrey`, etc.

---

## Step 5 — Add missing TextStyles tokens

If Step 1 identified any text style not already in `TextStyles`, edit `lib/core/theming/styles.dart`:

```dart
static TextStyle font{size}{Weight}{Color} = TextStyle(
  fontSize: {size}.sp,
  fontWeight: FontWeightHelper.{weight},
  color: ColorsManager.{colorToken},  // or Colors.white / Colors.black
);
```

Follow the exact naming convention already present in the file.

---

## Step 6 — Create widget files

For each section/component identified in Step 2, create one Dart file:

Path: `lib/features/{featureDir}/ui/widgets/{screenNameSnake}_widgets/{component_snake}.dart`

Widget rules:
- `StatelessWidget` by default. Use `StatefulWidget` only when the widget itself owns animation or `TextEditingController` state and nothing else can own it.
- Use `BlocBuilder<{ScreenName}Cubit, {ScreenName}State>` inside a widget only when that widget reacts to cubit state. Keep it as tight as possible (wrap only the subtree that actually rebuilds).
- All sizing: `.w` for widths, `.h` for heights, `.r` for radii/symmetric, `.sp` inside TextStyles only — never inline. `double.infinity` needs no extension.
- Gaps: `verticalSpace(n)` / `horizontalSpace(n)` helpers (from `lib/core/helpers/spacing.dart`) — never `SizedBox(height: n.h)` manually.
- SVG assets: `SvgPicture.asset('assets/svgs/{file}.svg')` — no width/height hardcoded unless the design specifies it (use `.w`/`.h` extensions).
- Image assets: use `lib/core/widgets/image_widget.dart` if it covers the case.
- Do NOT add code comments explaining what the code does — name everything clearly instead.

---

## Step 7 — Create the screen file

File: `lib/features/{featureDir}/ui/{screenNameSnake}_screen.dart`

Template (adapt to the actual design — this is structure only):

```dart
import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
// Import only section-level widgets, not deep children
import 'package:flutter_complete_project/features/{featureDir}/ui/widgets/{screenNameSnake}_widgets/{section_a}.dart';
// ... other section imports

class {ScreenName}Screen extends StatelessWidget {
  const {ScreenName}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.moreLighterGrey, // adjust to design
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Fixed header / navbar (if present)
            const {ScreenName}Navbar(),
            // Scrollable body
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(16),
                    const {SectionA}Section(),
                    verticalSpace(24),
                    // ... other sections
                    verticalSpace(24),
                  ],
                ),
              ),
            ),
            // Fixed footer CTA (if present)
            const {ScreenName}BottomBar(),
          ],
        ),
      ),
    );
  }
}
```

Key rules:
- `SafeArea(bottom: false, ...)` — always, no exceptions.
- `Scaffold` `backgroundColor` must use a `ColorsManager.*` token.
- If the screen has NO scrollable content (fixed layout), omit `SingleChildScrollView` and use direct children in `Column`.
- If the screen has a `BlocConsumer`, structure it around the body column, not around `Scaffold`:
  ```dart
  body: SafeArea(
    bottom: false,
    child: BlocConsumer<{ScreenName}Cubit, {ScreenName}State>(
      listener: (context, state) { /* error handling */ },
      builder: (context, state) {
        return Column(...); // same structure as above
      },
    ),
  ),
  ```

---

## Step 8 — Register route constant

Edit `lib/core/routing/routes.dart`. Add:

```dart
static const String {routeConst} = '/{routeConst}';
```

---

## Step 9 — Register route in AppRouter

Edit `lib/core/routing/app_router.dart`. Add imports and a new `case`:

**cubitsMode = `none` — pure UI:**
```dart
case Routes.{routeConst}:
  return MaterialPageRoute(
    builder: (_) => const {ScreenName}Screen(),
  );
```

**cubitsMode = `new` — new Cubit scaffolded in this skill:**
```dart
import 'package:flutter_complete_project/features/{featureDir}/ui/{screenNameSnake}_screen.dart';
import 'package:flutter_complete_project/features/{featureDir}/ui/logic/{screenNameSnake}_cubit.dart';

case Routes.{routeConst}:
  return MaterialPageRoute(
    builder: (_) => BlocProvider<{ScreenName}Cubit>(
      create: (_) => sl<{ScreenName}Cubit>(),
      child: const {ScreenName}Screen(),
    ),
  );
```

**cubitsMode = `linked:<CubitClassName>` — existing Cubit:**

Locate the existing Cubit's import path under `lib/features/` first, then:

```dart
// Use the actual path found in the project — not a placeholder
import 'package:flutter_complete_project/features/{existingFeature}/ui/logic/{existing_cubit_snake}.dart';
import 'package:flutter_complete_project/features/{featureDir}/ui/{screenNameSnake}_screen.dart';

case Routes.{routeConst}:
  return MaterialPageRoute(
    builder: (_) => BlocProvider<{LinkedCubitClassName}>(
      create: (_) => sl<{LinkedCubitClassName}>(),
      child: const {ScreenName}Screen(),
    ),
  );
```

---

## Step 10 — Verify

Run in order:

```bash
flutter analyze
```

Zero errors required. If there are errors, fix them before reporting done.

Also confirm:
- Every widget file uses only `ColorsManager.*` and `TextStyles.*` — no raw hex, no `Colors.grey`, no inline `TextStyle`.
- Every dimension uses `.w` / `.h` / `.r` — no raw `double` literals.
- `SafeArea(bottom: false)` is present at the screen root.
- `flutter analyze` exits clean.

---

## Hard rules (violations break the skill)

| Rule | Detail |
|------|--------|
| SafeArea | Always `SafeArea(bottom: false)` at screen root |
| Colors | `ColorsManager.*` only — extend the class if a token is missing |
| Text styles | `TextStyles.*` only — extend the class if a style is missing |
| Sizing | `.w` widths, `.h` heights, `.r` radii — no raw numbers |
| Gaps | `verticalSpace(n)` / `horizontalSpace(n)` — not `SizedBox` |
| Widget separation | One file per visual section, one file per list item type |
| Cubit modes | `new` = scaffold fresh; `linked` = reuse existing (ask which one); `none` = pure UI — always confirm with the user |
| UI Cubit state | `@immutable` plain class + `copyWith`, NOT Freezed |
| Data Cubit state | Freezed + `ApiResult` — only when connecting to a real API |
| No comments | Do not explain WHAT the code does in comments |
| No inline styles | No `fontSize`, `fontWeight`, `color` literals inside widgets |
| `flutter analyze` | Must exit clean before the skill reports done |
