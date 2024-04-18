import 'package:flutter/material.dart';

/// An [InheritedWidget] to pass data down the widget tree.
/// 
/// This widget allows the passing and inheriting of route arguments
/// throughout the widget subtree, making it accessible anywhere in the context.
/// 
/// Example usage:
/// ```dart
/// AwesomeArguments(
///   page: MyPage(),
///   arguments: {'key': 'value'},
/// )
/// ```
class AwesomeArguments extends InheritedWidget {
  /// Arguments passed down to widgets. This map holds all the data
  /// needed by widgets within this inherited widget's scope.
  final Map<String, dynamic> arguments;

  /// Constructs an [AwesomeArguments] widget that inherits from [InheritedWidget].
  /// 
  /// The [page] argument takes a widget which will be the child that needs access to the arguments.
  /// The [arguments] is an optional map that carries data to be passed down the widget tree.
  const AwesomeArguments({
    super.key, 
    required Widget page,
    this.arguments = const {},
  }) : super(child: page);

  /// Retrieves the nearest [AwesomeArguments] instance from the widget tree.
  /// 
  /// This static method provides easy access to the arguments map from any widget within the tree,
  /// by simply calling `AwesomeArguments.of(context)`.
  /// 
  /// Returns `null` if no [AwesomeArguments] is found in the widget tree.
  static AwesomeArguments? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AwesomeArguments>();
  }

  /// Determines whether the widget tree needs to be rebuilt.
  /// 
  /// This method is called automatically by the Flutter framework to determine whether
  /// the widget tree needs to be rebuilt in response to state changes. It returns `true`
  /// if the new instance's arguments differ from the old widget's arguments, indicating
  /// that the tree depends on the data held in [arguments].
  @override
  bool updateShouldNotify(AwesomeArguments oldWidget) {
    return arguments != oldWidget.arguments;
  }
}
