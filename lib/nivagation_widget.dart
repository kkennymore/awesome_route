import 'package:flutter/material.dart';

class NavigationWidget{
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
        decoration:  BoxDecoration(
          color:  backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        padding: padding,
        child: child,
      ),
    );
  }
}