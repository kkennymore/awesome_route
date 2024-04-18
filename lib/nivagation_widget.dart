import 'package:flutter/material.dart';

/// A utility class for creating navigational widgets with customized visual styles.
///
/// This class provides a static method `navigation` to create a widget that behaves like a button with an optional callback, custom padding, background color, and border radius.
class NavigationWidget {
  
  /// Creates a navigational touch area with customizable appearance and behavior.
  ///
  /// This method returns a widget that encapsulates a touchable area (using [InkWell]) which can trigger navigation or any other action when tapped.
  ///
  /// Parameters:
  /// - [context]: The [BuildContext] which may be used by the callback.
  /// - [onTap]: A callback function that is called when the widget is tapped.
  /// - [child]: The widget displayed inside the touchable area. This can be any widget like text, icon, etc.
  /// - [borderRadius]: The border radius of the inner container and the inkwell splash. Defaults to 10.0.
  /// - [backgroundColor]: The color of the background of the touch area. Defaults to [Colors.black26].
  /// - [padding]: The padding inside the container. This affects the space around the [child]. Defaults to `EdgeInsets.all(10.0)`.
  ///
  /// Returns:
  /// A [Widget] that provides an interactive area which can be used for navigation or executing any [VoidCallback].
  static Widget navigation({
    required BuildContext context,
    required VoidCallback onTap,
    Widget? child,
    double borderRadius = 10.0,
    Color backgroundColor = Colors.black26,
    EdgeInsets padding = const EdgeInsets.all(10.0),
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        padding: padding,
        child: child,
      ),
    );
  }
}
