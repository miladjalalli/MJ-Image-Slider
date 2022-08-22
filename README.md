

# MJ Image Slider

![](https://github.com/miladjalalli/MJ-Image-Slider/blob/master/images/example.gif?raw=true)

## Supported platforms

* Flutter Android
* Flutter iOS
* Flutter web
* Flutter desktop

## Installation

Add `mj_image_slider:` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:mj_image_slider/MJOptions.dart';
import 'package:mj_image_slider/mj_image_slider.dart';
```

## How to use

Simply create a `MJImageSLider` widget, and pass the required params:

```dart

List<String> images = [
    "assets/images/images_1.jpg",
    "assets/images/images_2.jpg",
    "assets/images/images_3.jpg",
    "assets/images/images_4.jpg",
  ];
  
MJImageSlider(
  options: MjOptions(height: 200.0,wifth:400),
  widgets: [...images.map((e) => Image(image: AssetImage(e))).toList()],
)
```



## Params

```dart

MJImageSlider(
   options: MjOptions(
      height: 200,
      width:400
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
   ),
   widgets:widgets,
 )
```