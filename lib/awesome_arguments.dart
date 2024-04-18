import 'package:flutter/material.dart';

class AwesomeArguments extends InheritedWidget {
  final Map<String, dynamic> arguments;

  AwesomeArguments({
    required this.arguments,
    required Widget child,
  }) : super(child: child);

  static AwesomeArguments? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AwesomeArguments>();
  }

  @override
  bool updateShouldNotify(AwesomeArguments oldWidget) {
    return arguments != oldWidget.arguments;
  }
}
