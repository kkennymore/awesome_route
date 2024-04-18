
enum AnimateAwesomeRoute {
  /// Defines the types of animations available for route transitions.
/// 
/// This enum is used to specify the type of animation that should be applied when navigating between pages in a Flutter application. Each value represents a different animation style, providing a variety of visual effects.
///
/// Enum values:
/// - `fade`: Simple fade transition.
/// - `slide`: Slide transition from bottom to top.
/// - `push`: Pushes the new screen onto the old screen.
/// - `rotate`: Rotates the screen during the transition.
/// - `scale`: Scales the screen from or to a focal point during transition.
/// - `opacity`: Changes the opacity from transparent to opaque during transition.
/// - `rotateX`: Rotates around the X-axis (horizontal).
/// - `rotateY`: Rotates around the Y-axis (vertical).
/// - `translate`: Moves the screen in a specified direction.
/// - `scaleAndRotate`: Combines scaling and rotating effects.
/// - `slideAndFade`: Combines sliding and fading effects.
/// - `translateLeftToRight`: Moves the screen from left to right.
/// - `translateRightToLeft`: Moves the screen from right to left.
/// - `translateUpToDown`: Moves the screen from top to bottom.
/// - `translateDownToUp`: Moves the screen from bottom to top.
/// - `translateUpToUp`: Moves the screen upwards continuously.
/// - `translateDownToDown`: Moves the screen downwards continuously.
/// - `slideAndFadeFromLeft`: Slide from left combined with a fade-in effect.
/// - `slideAndFadeFromRight`: Slide from right combined with a fade-in effect.
/// - `slideAndFadeFromTop`: Slide from top combined with a fade-in effect.
/// - `opacityAndSlideFromRight`: Combine opacity change with sliding from right.
/// - `opacityAndSlideFromLeft`: Combine opacity change with sliding from left.
/// - `opacityAndSlideFromTop`: Combine opacity change with sliding from the top.
/// - `opacityAndSlideFromDown`: Combine opacity change with sliding from the bottom.
///
/// Use these enums to customize the visual transitions between pages in your Flutter application to enhance the user experience with dynamic effects.
  fade,
  slide,
  push,
  rotate,
  scale,
  opacity,
  rotateX,
  rotateY,
  translate,
  scaleAndRotate,
  slideAndFade,
  translateLeftToRight,
  translateRightToLeft,
  translateUpToDown,
  translateDownToUp,
  translateUpToUp,
  translateDownToDown,
  slideAndFadeFromLeft,
  slideAndFadeFromRight,
  slideAndFadeFromTop,
  opacityAndSlideFromRight,
  opacityAndSlideFromLeft,
  opacityAndSlideFromTop,
  opacityAndSlideFromDown
}
