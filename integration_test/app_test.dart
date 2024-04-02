import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_integration_testing_app/main.dart' as app;
import 'package:patrol/patrol.dart';


void main(){
  testWidgets("Increment counter by 10", (WidgetTester tester) async {

    //setup:
    app.main();
    await tester.pumpAndSettle();

    //find the widget :
    final Finder button = find.byIcon(Icons.add);

    //do
    for (int i=0; i<10; i++){
      await tester.tap(button);
      await Future.delayed(const Duration(seconds: 1));
    }

    await tester.pumpAndSettle();

  });
}