library awesome_route;
import 'package:flutter/material.dart';
import 'package:awesome_route/animate_awesome_route.dart';
import 'package:awesome_route/create_route.dart';
import 'package:awesome_route/nivagation_widget.dart';
export 'package:awesome_route/awesome_arguments.dart';

class AwesomeRoute {

/// A routing library for Flutter applications that allows for dynamic and customizable page navigation.
///
/// This library provides a comprehensive set of functionalities for managing navigation with custom animations,
/// clearing navigation histories, and handling complex transitions between screens.
  static Map<String, Widget Function(BuildContext, Map<String, dynamic>?)>? _routeMap;

  /// Constructs an AwesomeRoute with dynamically declared page widgets.
  ///
  /// [pages]: A map of route identifiers to widget constructors which allows for dynamic route creation based on given context and arguments.
  AwesomeRoute({Map<String, Widget Function(BuildContext, Map<String, dynamic>?)>? pages}) {
    _routeMap = pages;
  }

  /// Navigates to a specified route with optional animation, duration, and history clearing capabilities.
  ///
  /// [context]: The BuildContext from which the navigation is initiated.
  /// [routeName]: The name of the route to navigate to, as defined in [_routeMap].
  /// [animations]: The type of animation to apply to the route transition.
  /// [duration]: The duration of the transition animation.
  /// [clearHist]: A boolean that determines whether to clear the navigation stack up to the first route.
  /// [arguments]: A map of arguments to pass to the new route.
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

  /// Internal method to retrieve the widget for the given route.
  ///
  /// Throws an exception if the route map is not initialized or if the route is not found.
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

  /// Pushes a new route on the navigation stack while maintaining the previous navigation state,
  /// using specified animations and a customizable widget.
  ///
  /// [context]: The BuildContext from which the navigation is initiated.
  /// [page]: The widget to navigate to.
  /// [child]: A child widget to display inside a navigational container.
  /// [animationType]: The type of animation to use during the transition.
  /// [duration]: The duration of the animation.
  /// [borderRadius]: The border radius of the navigational container.
  /// [backgroundColor]: The background color of the navigational container.
  /// [padding]: The padding inside the navigational container.
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

static pop(context) => Navigator.pop(context);

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