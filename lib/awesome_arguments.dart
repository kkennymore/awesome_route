import 'package:flutter/material.dart';

class AwesomeArguments extends InheritedWidget {
  final Map<String, dynamic> arguments;

  AwesomeArguments({
    required Widget page,
    this.arguments = const {},
  }) : super(child: page);

  static AwesomeArguments? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AwesomeArguments>();
  }

  @override
  bool updateShouldNotify(AwesomeArguments oldWidget) {
    return arguments != oldWidget.arguments;
  }
}
