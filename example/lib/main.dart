import 'package:fancy_image_loader/fancy_image_loader.dart';
import 'package:fancy_image_loader_example/assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                FancyImageLoader(
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                    path: ImageAssets.flutter,
                    placeholder: ImageAssets.placeholder),
                SizedBox(
                  height: 30,
                  width: double.maxFinite,
                ),
                FancyImageLoader(
                  path: SVGAssets.flutter,
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: 30,
                ),
                FancyImageLoader(
                  path: "https://picsum.photos/200/200",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
