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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            FancyImageLoader(
                path: ImageAssets.flutter,
                placeholder: ImageAssets.placeholder),
            SizedBox(
              height: 30,
            ),
            FancyImageLoader(path: SVGAssets.flutter,height:70 ,width: 100,),
            SizedBox(
              height: 30,
            ),
            FancyImageLoader(path: "https://picsum.photos/200/300"),
          ],
        ),
      ),
    );
  }
}
