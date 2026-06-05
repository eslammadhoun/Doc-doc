import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/doc_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Onboarding screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(DocApp(appRouter: AppRouter(), isLoggedIn: false));

    // Verify that onboarding screen shows the main description text and "Get Started" button.
    expect(find.text('Get Started'), findsOneWidget);
    expect(
      find.text('Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.'),
      findsOneWidget,
    );
  });
}

