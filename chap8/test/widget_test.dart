// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ch8_bottom_app_bar/app.dart';

void main() {
  testWidgets('shows central menu with all chapter 8 activities', (WidgetTester tester) async {
    await tester.pumpWidget(const Chapter8ActivitiesApp());

    expect(find.text('Chapter 8 Activities'), findsOneWidget);
    expect(find.byKey(const ValueKey('Navigator')), findsOneWidget);
    expect(find.byKey(const ValueKey('Drawer')), findsOneWidget);
    expect(find.byKey(const ValueKey('TabBar')), findsOneWidget);
    expect(find.byKey(const ValueKey('Bottom Navigation Bar')), findsOneWidget);
    expect(find.byKey(const ValueKey('Bottom App Bar')), findsOneWidget);
    expect(find.byKey(const ValueKey('Hero Animation')), findsOneWidget);
  });

  testWidgets('navigates from menu to selected activity', (WidgetTester tester) async {
    await tester.pumpWidget(const Chapter8ActivitiesApp());

    await tester.tap(find.byKey(const ValueKey('Navigator')));
    await tester.pumpAndSettle();

    expect(find.text('Navigator'), findsOneWidget);
    expect(find.textContaining('Grateful for:'), findsOneWidget);
  });
}
