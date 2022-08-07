library mj_image_slider;

import 'dart:async';

import 'package:flutter/material.dart';

class MJImageSlider extends StatefulWidget {
  late List<String> images;
  late bool useLocalAssetImages;
  late Duration duration;
  late double width;
  late double height;
  late Curve? curve; //use this when you want slider change with animation

  MJImageSlider(
      {required this.images,
      required this.useLocalAssetImages,
      required this.duration,
      required this.width,
      required this.height,
      this.curve});

  @override
  State<MJImageSlider> createState() => _MJImageSliderState();
}

class _MJImageSliderState extends State<MJImageSlider> with SingleTickerProviderStateMixin{
  PageController controller = PageController();
  double currentPageValue = 0.0;
  late Timer timer;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });

    timer = Timer.periodic(widget.duration, (timer) {
      int nextPage = 0;
      if(currentPageValue < widget.images.length - 1) {
        nextPage = currentPageValue.toInt() + 1;
      }

      if (widget.curve == null) {
          controller.jumpToPage(nextPage);
        } else {
          controller.animateTo(nextPage.toDouble(), duration: widget.duration, curve: widget.curve!);
        }

    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return widget.useLocalAssetImages
            ? Image(
                image: AssetImage(widget.images[index]),
                height: widget.height,
                width: widget.width,
                fit: BoxFit.fill,
              )
            : Image(
                image: NetworkImage(widget.images[index]),
                height: widget.height,
                width: widget.width,
                fit: BoxFit.fill,
              );
      },
      itemCount: widget.images.length,
    );
  }
}
