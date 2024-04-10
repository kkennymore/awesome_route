import 'package:flutter/material.dart';
import 'package:routex/animate_routex.dart';

class CreateRoute{
  static Route route(
      Widget page, AnimateRoutex animationType, Duration duration) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var curve = Curves.easeInOut;
        var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);
        Widget transition;
        switch (animationType) {
          case AnimateRoutex.fade:
            transition = FadeTransition(opacity: curvedAnimation, child: child);
            break;
          case AnimateRoutex.slide:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateRoutex.push:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, 1.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateRoutex.rotate:
            transition =
                RotationTransition(turns: curvedAnimation, child: child);
            break;
          case AnimateRoutex.scale:
            transition = ScaleTransition(scale: curvedAnimation, child: child);
            break;
          case AnimateRoutex.opacity:
            transition = FadeTransition(opacity: curvedAnimation, child: child);
            break;
          case AnimateRoutex.rotateX:
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
          case AnimateRoutex.rotateY:
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
          case AnimateRoutex.translate:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateRoutex.scaleAndRotate:
            transition = ScaleTransition(
              scale: curvedAnimation,
              child: RotationTransition(turns: curvedAnimation, child: child),
            );
            break;
          case AnimateRoutex.slideAndFade:
            transition = SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
                      .animate(curvedAnimation),
              child: FadeTransition(opacity: curvedAnimation, child: child),
            );
            break;
          case AnimateRoutex.translateLeftToRight:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateRoutex.translateRightToLeft:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateRoutex.translateUpToDown:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, -1.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateRoutex.translateDownToUp:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, 1.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateRoutex.translateUpToUp:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateRoutex.translateDownToDown:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: child);
            break;
          case AnimateRoutex.slideAndFadeFromLeft:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: FadeTransition(opacity: curvedAnimation, child: child));
            break;
          case AnimateRoutex.slideAndFadeFromRight:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: FadeTransition(opacity: curvedAnimation, child: child));
            break;
          case AnimateRoutex.slideAndFadeFromTop:
            transition = SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, -1.0), end: Offset.zero)
                    .animate(curvedAnimation),
                child: FadeTransition(opacity: curvedAnimation, child: child));
            break;
          case AnimateRoutex.opacityAndSlideFromRight:
            transition = FadeTransition(
                opacity: curvedAnimation,
                child: SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0), end: Offset.zero)
                        .animate(curvedAnimation),
                    child: child));
            break;
          case AnimateRoutex.opacityAndSlideFromLeft:
            transition = FadeTransition(
                opacity: curvedAnimation,
                child: SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(-1.0, 0.0), end: Offset.zero)
                        .animate(curvedAnimation),
                    child: child));
            break;
          case AnimateRoutex.opacityAndSlideFromTop:
            transition = FadeTransition(
                opacity: curvedAnimation,
                child: SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(0.0, -1.0), end: Offset.zero)
                        .animate(curvedAnimation),
                    child: child));
            break;
          case AnimateRoutex.opacityAndSlideFromDown:
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