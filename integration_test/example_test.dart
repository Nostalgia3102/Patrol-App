import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_integration_testing_app/main.dart';

void main() {
  patrolTest(
    'Clicking the + icon 10 times and checking the counter value',
        ($) async {
      // Replace later with your app's main widget
      await $.pumpWidgetAndSettle(const MyApp());

      // expect($('app'), findsOneWidget);

      // Click the + icon 10 times
      for (int i = 0; i < 10; i++) {
        // await Future.delayed(const Duration(seconds: 1));
        await $.tap(find.byIcon(Icons.add));
        // await Future.delayed(const Duration(seconds: 1));
        await $.pumpAndSettle();
      }

      // Check the counter value
      expect(find.text('10'), findsOneWidget);

      // Optionally, check other aspects of the UI if needed
      expect(find.text('You have pushed the button this many times:'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      // Press home button if not running on macOS
      if (!Platform.isMacOS) {
        await $.native.pressHome();
      }
    }
  );
}
