import 'package:awesome_route/animate_awesome_route.dart';
import 'package:awesome_route/awesome_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('AwesomeRoute navigation tests', () {
    testWidgets(
        'push method navigates to the correct page with correct animation',
        (WidgetTester tester) async {
      // Create the mock NavigatorObserver
      final mockObserver = MockNavigatorObserver();
      // Create a MaterialApp, injecting the mockObserver
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return AwesomeRoute.push(
                context: context,
                page: Scaffold(
                    appBar: AppBar(
                        title: const Text(
                            'Destination Page'))), // Destination Page
                child: const Text(
                    'Navigate'), // This would typically be your source widget
                animationType: AnimateAwesomeRoute.fade, // Example animation type
                duration: const Duration(seconds: 1),
              );
            },
          ),
        ),
        navigatorObservers: [mockObserver],
      ));

      // Simulate a button tap to trigger navigation
      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle(); // Wait for the animation to complete
    });

     testWidgets(
        'pushAndClear method navigates to the correct page with correct animation and remove the just left page from navigation history',
        (WidgetTester tester) async {
      // Create the mock NavigatorObserver
      final mockObserver = MockNavigatorObserver();
      // Create a MaterialApp, injecting the mockObserver
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return AwesomeRoute.pushAndClear(
                context: context,
                page: Scaffold(
                    appBar: AppBar(
                        title: const Text(
                            'Destination Page'))), // Destination Page
                child: const Text(
                    'Navigate'), // This would typically be your source widget
                animationType: AnimateAwesomeRoute.fade, // Example animation type
                duration: const Duration(seconds: 1),
              );
            },
          ),
        ),
        navigatorObservers: [mockObserver],
      ));

      // Simulate a button tap to trigger navigation
      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle(); // Wait for the animation to complete
    });


    testWidgets(
        'pushAndClearAll method navigates to the correct page with correct animation and all the navigation history',
        (WidgetTester tester) async {
      // Create the mock NavigatorObserver
      final mockObserver = MockNavigatorObserver();
      // Create a MaterialApp, injecting the mockObserver
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return AwesomeRoute.pushAndClearAll(
                context: context,
                page: Scaffold(
                    appBar: AppBar(
                        title: const Text(
                            'Destination Page'))), // Destination Page
                child: const Text(
                    'Navigate'), // This would typically be your source widget
                animationType: AnimateAwesomeRoute.fade, // Example animation type
                duration: const Duration(seconds: 1),
              );
            },
          ),
        ),
        navigatorObservers: [mockObserver],
      ));

      // Simulate a button tap to trigger navigation
      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle(); // Wait for the animation to complete
    });


    testWidgets(
        'pushRoute method navigates to the correct page and option to pass route function with correct animation and all the navigation history is kept',
        (WidgetTester tester) async {
      // Create the mock NavigatorObserver
      final mockObserver = MockNavigatorObserver();
      // Create a MaterialApp, injecting the mockObserver
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return AwesomeRoute.pushRoute(
                context: context,
                route: ()async{
                  Scaffold(
                    appBar: AppBar(
                        title: const Text('Destination Page'),
                        ),
                    );
                }, 
                child: const Text('Navigate'), // This would typically be your source widget
                animationType: AnimateAwesomeRoute.fade, // Example animation type
                duration: const Duration(seconds: 1),
              );
            },
          ),
        ),
        navigatorObservers: [mockObserver],
      ));

      // Simulate a button tap to trigger navigation
      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle(); // Wait for the animation to complete
    });


    testWidgets(
        'pushRouteAndClear method navigates to the correct page and option to pass route function with correct animation and clear only the previous navigation history',
        (WidgetTester tester) async {
      // Create the mock NavigatorObserver
      final mockObserver = MockNavigatorObserver();
      // Create a MaterialApp, injecting the mockObserver
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return AwesomeRoute.pushRouteAndClear(
                context: context,
                route: ()async{
                  Scaffold(
                    appBar: AppBar(
                        title: const Text('Destination Page'),
                        ),
                    );
                }, 
                child: const Text('Navigate'), // This would typically be your source widget
                animationType: AnimateAwesomeRoute.fade, // Example animation type
                duration: const Duration(seconds: 1),
              );
            },
          ),
        ),
        navigatorObservers: [mockObserver],
      ));

      // Simulate a button tap to trigger navigation
      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle(); // Wait for the animation to complete
    });


    testWidgets(
        'pushRouteAndClearAll method navigates to the correct page and option to pass route function with correct animation and clear all the navigation history',
        (WidgetTester tester) async {
      // Create the mock NavigatorObserver
      final mockObserver = MockNavigatorObserver();
      // Create a MaterialApp, injecting the mockObserver
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return AwesomeRoute.pushRouteAndClearAll(
                context: context,
                route: ()async{
                  Scaffold(
                    appBar: AppBar(
                        title: const Text('Destination Page'),
                        ),
                    );
                }, 
                child: const Text('Navigate'), // This would typically be your source widget
                animationType: AnimateAwesomeRoute.fade, // Example animation type
                duration: const Duration(seconds: 1),
              );
            },
          ),
        ),
        navigatorObservers: [mockObserver],
      ));

      // Simulate a button tap to trigger navigation
      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle(); // Wait for the animation to complete
    });


  });
}
