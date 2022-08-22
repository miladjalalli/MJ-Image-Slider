library mj_image_slider;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mj_image_slider/MJOptions.dart';

class MJImageSlider extends StatefulWidget {
  late List<Widget> widgets;
  MjOptions options;

  MJImageSlider({required this.widgets,
    required this.options});

  @override
  State<MJImageSlider> createState() => _MJImageSliderState();
}

class _MJImageSliderState extends State<MJImageSlider> {
  late PageController controller;
  double currentPageValue = 0.0;
  late Timer timer;

  @override
  void initState() {
    controller = PageController(
        viewportFraction: widget.options.viewportFraction,
        initialPage: widget.options.initialPage
    );

    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });

    timer = Timer.periodic(widget.options.autoPlayInterval, (timer) {
      late int nextPage;
      if (widget.options.enableInfiniteScroll){
        nextPage = 0;
      }else{
        nextPage = currentPageValue.toInt();
      }


      if (currentPageValue < widget.widgets.length - 1) nextPage = currentPageValue.toInt() + 1;

      if (widget.options.autoPlayCurve == null) {
        controller.jumpToPage(nextPage);
      } else {
        controller.animateToPage(nextPage, duration: widget.options.autoPlayAnimationDuration, curve: widget.options.autoPlayCurve);
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
    return widget.options.height != null
        ? SizedBox(
        height: widget.options.height,
        width: widget.options.width,
        child: PageView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            return widget.widgets[index];
          },
          onPageChanged: (index){
            widget.options.onPageChanged!(index);
          },
          scrollDirection: widget.options.scrollDirection,
          itemCount: widget.widgets.length,
        ))
        : AspectRatio(
      aspectRatio: widget.options.aspectRatio,
      child: PageView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return widget.widgets[index];
        },
        onPageChanged: (index){
          widget.options.onPageChanged!(index);
        },
        scrollDirection: widget.options.scrollDirection,
        itemCount: widget.widgets.length,
      ),
    );
  }
}
