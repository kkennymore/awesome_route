library awesome_route;
import 'package:flutter/material.dart';
import 'package:awesome_route/animate_awesome_route.dart';
import 'package:awesome_route/create_route.dart';
import 'package:awesome_route/nivagation_widget.dart';
export 'package:awesome_route/awesome_arguments.dart';

class AwesomeRoute {

static Map<String, Widget Function(BuildContext, Map<String, dynamic>?)>? _routeMap;
// this will allow for the page widget declaration dynamically
  AwesomeRoute({Map<String, Widget Function(BuildContext, Map<String, dynamic>?)>? pages}) {
    _routeMap = pages;
  }

    // simple elegant routing 
  static Future<void> go(
  BuildContext context,
  String routeName, {
  AnimateAwesomeRoute? animations = AnimateAwesomeRoute.opacityAndSlideFromRight,
  Duration? duration = const Duration(seconds: 1),
  bool clearHist = false,
  Map<String, dynamic>? arguments,
}) async {
  Widget page = _getPage(context, routeName, arguments);
  Route route = CreateRoute.route(page, animations!, duration!);

  if (clearHist) {
    Navigator.of(context).pushAndRemoveUntil(route, (_) => false);
  } else {
    Navigator.of(context).push(route);
  }
}


  static Widget _getPage(BuildContext context, String routeName, Map<String, dynamic>? arguments) {
    if (_routeMap == null) {
      throw Exception('Route map is not initialized. Call AwesomeRoute.pages() first.');
    }
    if (_routeMap!.containsKey(routeName)) {
      return _routeMap![routeName]!(context, arguments);
    } else {
      throw Exception('Route not found: $routeName');
    }
  }



  /// with this route you can simply navigate to another page with all the previous navigation state 
  /// kept intact
  static Widget push({
    required BuildContext context,
    required Widget page,
    required Widget child,
    AnimateAwesomeRoute animationType = AnimateAwesomeRoute.opacityAndSlideFromRight,
    Duration duration = const Duration(seconds: 1),
    double borderRadius = 10.0,
    Color backgroundColor = Colors.black26,
    EdgeInsets padding = const EdgeInsets.all(10),
  }) {
    return NavigationWidget.navigation(
      context: context,
      onTap: () => Navigator.of(context)
          .push(CreateRoute.route(page, animationType, duration)),
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      child: child,
    );
  }



  static Widget pop(context, {
    AnimateAwesomeRoute animationType = AnimateAwesomeRoute.opacityAndSlideFromRight,
    Duration duration = const Duration(seconds: 1),
    double borderRadius = 10.0,
    Color backgroundColor = Colors.black26,
    EdgeInsets padding = const EdgeInsets.all(10),
  }) {
    return NavigationWidget.navigation(
      context: context,
      onTap: () => Navigator.pop(context),
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
    );
  }

/// with this route you can simply navigate to another page with all the previous navigation state 
  /// kept intact excpet the immediate parent, it will remove the just left page from the navigation history
  static Widget pushAndClear({
    required BuildContext context,
    required Widget page,
    required Widget child,
    AnimateAwesomeRoute animationType = AnimateAwesomeRoute.opacityAndSlideFromRight,
    Duration duration = const Duration(seconds: 1),
    double borderRadius = 10.0,
    Color backgroundColor = Colors.black26,
    EdgeInsets padding = const EdgeInsets.all(10),
  }) {
    return NavigationWidget.navigation(
      context: context,
      onTap: () => Navigator.of(context)
          .pushReplacement(CreateRoute.route(page, animationType, duration)),
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      child: child,
    );
  }

/// with this route you can simply navigate to another page without keeping any of the prevoius navigation history
  static Widget pushAndClearAll({
    required BuildContext context,
    required Widget page,
    required Widget child,
    AnimateAwesomeRoute animationType =
        AnimateAwesomeRoute.opacityAndSlideFromRight,
    Duration duration = const Duration(seconds: 1),
    double borderRadius = 10.0,
    Color backgroundColor = Colors.black26,
    EdgeInsets padding = const EdgeInsets.all(10),
  }) {
    return NavigationWidget.navigation(
      context: context,
      onTap: () => Navigator.of(context).pushAndRemoveUntil(
        CreateRoute.route(
          PopScope(
            canPop: false,
            child: page,
          ),
          animationType,
          duration,
        ),
        (_) => false,
      ),
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      child: child,
    );
  }

/// with this route you have the ability to pass a function to the route
/// and process some logic before pushing to the next page, like the submission of form,
/// it retains all the navigation histories
  static Widget pushRoute({
    required BuildContext context,
    required Future<void> Function() route, // Declaring 'route' as a generic function type
    required Widget child,
    AnimateAwesomeRoute animationType = AnimateAwesomeRoute.opacityAndSlideFromRight,
    Duration duration = const Duration(seconds: 1),
    double borderRadius = 10.0,
    Color backgroundColor = Colors.black26,
    EdgeInsets padding = const EdgeInsets.all(10),
    }){
      return NavigationWidget.navigation(
      context: context,
      onTap: route,
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      child: child,
    );
  }

 /// with this route you have the ability to pass a function to the route
/// and process some logic before pushing to the next page, like the submission of form
/// where you have to validate the form first, the pushRouteAndClear method upon moving to the next page will 
/// remove the screen it is leaving from the navigation history so that the screen cannot be pop back to the just left sceen,
/// trying to do that will rather go to the older history
/// 
  static Widget pushRouteAndClear({
    required BuildContext context,
    required Future<void> Function() route, // Declaring 'route' as a generic function type
    required Widget child,
    AnimateAwesomeRoute animationType = AnimateAwesomeRoute.opacityAndSlideFromRight,
    Duration duration = const Duration(seconds: 1),
    double borderRadius = 10.0,
    Color backgroundColor = Colors.black26,
    EdgeInsets padding = const EdgeInsets.all(10),
    }){
      return NavigationWidget.navigation(
      context: context,
      onTap: () => Navigator.of(context)
          .pushReplacement(CreateRoute.route(child, animationType, duration)),
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      child: child,
    );
  }

/// with this route you have the ability to pass a function to the route
/// and process some logic before pushing to the next page, like the submission of form
/// where you have to validate the form first, the pushRouteAndClearAll method upon moving to the next page will 
/// clear all the previous navigation history so that the screen cannot be pop back to any of the history
/// trying to do that will exit the app

  static Widget pushRouteAndClearAll({
    required BuildContext context,
    required Future<void> Function() route, // Declaring 'route' as a generic function type
    required Widget child,
    AnimateAwesomeRoute animationType = AnimateAwesomeRoute.opacityAndSlideFromRight,
    Duration duration = const Duration(seconds: 1),
    double borderRadius = 10.0,
    Color backgroundColor = Colors.black26,
    EdgeInsets padding = const EdgeInsets.all(10),
    }){
    return NavigationWidget.navigation(
      context: context,
      onTap: () => Navigator.of(context).pushAndRemoveUntil(
        CreateRoute.route(
          PopScope(
            canPop: false,
            child: child,
          ),
          animationType,
          duration,
        ),
        (_) => false,
      ),
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      child: child,
    );
  }
}