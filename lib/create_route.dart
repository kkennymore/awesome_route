import 'package:flutter/material.dart';
import 'package:awesome_route/animate_awesome_route.dart';

/// The `CreateRoute` class provides a method to create page routes with customizable animations.
///
/// This class utilizes the `PageRouteBuilder` to enable a variety of transition animations between pages,
/// based on the animation type specified. It allows for dynamic creation of visually appealing transitions
/// for a better user experience.
class CreateRoute {

  /// Creates a route with the specified page and animation.
  ///
  /// This method utilizes the `PageRouteBuilder` to apply custom transitions as the user navigates between screens.
  /// Depending on the `animationType` chosen, different animations are applied.
  ///
  /// Parameters:
  ///   - [page]: The widget that will be displayed when the route is navigated to.
  ///   - [animationType]: The type of animation to use for the transition.
  ///   - [duration]: The duration of the transition.
  ///
  /// Returns:
  ///   A `Route` object that can be used with `Navigator.push` or similar methods to navigate to the `page`.
  static Route route(
      Widget page, 
      AnimateAwesomeRoute animationType, 
      Duration duration) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var curve = Curves.easeInOut;
        var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);
        Widget transition;
        
        switch (animationType) {
          case AnimateAwesomeRoute.fade:
            transition = FadeTransition(opacity: curvedAnimation, child: child);
            break;
          case AnimateAwesomeRoute.slide:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateAwesomeRoute.push:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, 1.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateAwesomeRoute.rotate:
            transition =
                RotationTransition(turns: curvedAnimation, child: child);
            break;
          case AnimateAwesomeRoute.scale:
            transition = ScaleTransition(scale: curvedAnimation, child: child);
            break;
          case AnimateAwesomeRoute.opacity:
            transition = FadeTransition(opacity: curvedAnimation, child: child);
            break;
          case AnimateAwesomeRoute.rotateX:
            transition = AnimatedBuilder(
              animation: curvedAnimation,
              child: child,
              builder: (context, child) => Transform(
                transform:
                    Matrix4.rotationX(2 * 3.1415 * curvedAnimation.value),
                alignment: Alignment.center,
                child: child,
              ),
            );
            break;
          case AnimateAwesomeRoute.rotateY:
            transition = AnimatedBuilder(
              animation: curvedAnimation,
              child: child,
              builder: (context, child) => Transform(
                transform:
                    Matrix4.rotationY(2 * 3.1415 * curvedAnimation.value),
                alignment: Alignment.center,
                child: child,
              ),
            );
            break;
          case AnimateAwesomeRoute.translate:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateAwesomeRoute.scaleAndRotate:
            transition = ScaleTransition(
              scale: curvedAnimation,
              child: RotationTransition(turns: curvedAnimation, child: child),
            );
            break;
          case AnimateAwesomeRoute.slideAndFade:
            transition = SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
                      .animate(curvedAnimation),
              child: FadeTransition(opacity: curvedAnimation, child: child),
            );
            break;
          case AnimateAwesomeRoute.translateLeftToRight:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateAwesomeRoute.translateRightToLeft:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateAwesomeRoute.translateUpToDown:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, -1.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateAwesomeRoute.translateDownToUp:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, 1.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateAwesomeRoute.translateUpToUp:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateAwesomeRoute.translateDownToDown:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateAwesomeRoute.slideAndFadeFromLeft:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: FadeTransition(opacity: curvedAnimation, child: child));
            break;
          case AnimateAwesomeRoute.slideAndFadeFromRight:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: FadeTransition(opacity: curvedAnimation, child: child));
            break;
          case AnimateAwesomeRoute.slideAndFadeFromTop:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, -1.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: FadeTransition(opacity: curvedAnimation, child: child));
            break;
          case AnimateAwesomeRoute.opacityAndSlideFromRight:
            transition = FadeTransition(
                opacity: curvedAnimation,
                child: SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0), end: Offset.zero)
                        .animate(curvedAnimation),
                    child: child));
            break;
          case AnimateAwesomeRoute.opacityAndSlideFromLeft:
            transition = FadeTransition(
                opacity: curvedAnimation,
                child: SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(-1.0, 0.0), end: Offset.zero)
                        .animate(curvedAnimation),
                    child: child));
            break;
          case AnimateAwesomeRoute.opacityAndSlideFromTop:
            transition = FadeTransition(
                opacity: curvedAnimation,
                child: SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(0.0, -1.0), end: Offset.zero)
                        .animate(curvedAnimation),
                    child: child));
            break;
          case AnimateAwesomeRoute.opacityAndSlideFromDown:
            transition = FadeTransition(
                opacity: curvedAnimation,
                child: SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(0.0, 1.0), end: Offset.zero)
                        .animate(curvedAnimation),
                    child: child));
            break;

          default:
            transition = child; // Fallback for any non-specified animations
        }
        return transition;
      },
    );
  }
}