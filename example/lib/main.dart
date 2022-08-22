import 'package:flutter/material.dart';
import 'package:mj_image_slider/MJOptions.dart';
import 'package:mj_image_slider/mj_image_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> images = [
    "assets/images/images_1.jpg",
    "assets/images/images_2.jpg",
    "assets/images/images_3.jpg",
    "assets/images/images_4.jpg",
  ];
  List<String> networkImages = [
    "https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80",
    "https://images.unsplash.com/photo-1546587348-d12660c30c50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80",
    "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1525127752301-99b0b6379811?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              MJImageSlider(
                options: MjOptions(onPageChanged: (i) {}, scrollDirection: Axis.vertical, height: 200, width: 400, viewportFraction: 4.0),
                widgets: [...images.map((e) => Image(image: AssetImage(e))).toList()],
              ),
              const SizedBox(
                width: 32,
              ),
              MJImageSlider(
                options: MjOptions(
                    onPageChanged: (i) {}, enableInfiniteScroll: false, autoPlayCurve: Curves.easeInToLinear, height: 200, width: 400, viewportFraction: 1.0),
                widgets: [...networkImages.map((e) => Image(image: NetworkImage(e))).toList()],
              ),
              const SizedBox(
                width: 32,
              ),
              MJImageSlider(
                options: MjOptions(onPageChanged: (i) {}, autoPlayCurve: Curves.easeInExpo, height: 200, width: 400, viewportFraction: 0.8),
                widgets: [
                  ...networkImages
                      .map((e) => Image(image: NetworkImage(e)))
                      .toList()
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
