// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter_test/flutter_test.dart';

import 'package:fancy_image_loader/fancy_image_loader.dart';

void main() {
  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        const FancyImageLoader(path: 'https://www.example.com/image.jpg'));

    // Verify that platform version is retrieved.
    expect(find.text('You have pushed the button this many times:'),
        findsOneWidget);
  });
}
