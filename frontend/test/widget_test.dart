// This is a basic Flutter widget test for Aegis

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aegis/main.dart';

void main() {
  testWidgets('App starts and shows home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: InnoxSecurityApp()));

    // Verify that the app bar shows Aegis
    expect(find.text('Aegis'), findsOneWidget);

    // Verify welcome card is present
    expect(find.text('LLM Vulnerability Scanner'), findsOneWidget);
  });
}
