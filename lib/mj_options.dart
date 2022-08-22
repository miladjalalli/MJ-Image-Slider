import 'package:flutter/material.dart';

class MjOptions {
  MjOptions({
    this.height,
    this.width,
    this.aspectRatio: 16 / 9,
    this.viewportFraction: 0.8,
    this.initialPage: 0,
    this.enableInfiniteScroll: true,
    this.autoPlayInterval: const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.autoPlayCurve: Curves.fastOutSlowIn,
    this.onPageChanged,
    this.scrollDirection: Axis.horizontal,
  });

  /// Set slider height and overrides any existing [aspectRatio].
  double? height;

  /// Set slider width and overrides any existing [aspectRatio].
  double? width;

  /// Aspect ratio is used if no height have been declared.
  ///
  /// Defaults to 16:9 aspect ratio.
  late double aspectRatio;

  /// The fraction of the viewport that each page should occupy.
  ///
  /// Defaults to 0.8, which means each page fills 80% of the slider.
  late double viewportFraction;

  /// The initial page to show when first creating the [Slider].
  ///
  /// Defaults to 0.
  int initialPage;

  ///Determines if slider should loop infinitely or be limited to item length.
  ///
  ///Defaults to true, i.e. infinite loop.
  late bool enableInfiniteScroll;

  /// Sets Duration to determent the frequency of slides when
  ///
  /// [autoPlay] is set to true.
  /// Defaults to 4 seconds.
  late Duration autoPlayInterval;

  /// The animation duration between two transitioning pages while in auto playback.
  ///
  /// Defaults to 800 ms.
  late Duration autoPlayAnimationDuration;

  /// Determines the animation curve physics.
  ///
  /// Defaults to [Curves.fastOutSlowIn].
  late Curve autoPlayCurve;

  /// The axis along which the page view scrolls.
  ///
  /// Defaults to [Axis.horizontal].
  late Axis scrollDirection;

  /// Called whenever the page in the center of the viewport changes.
  Function(int index)? onPageChanged;
}
