import 'package:flutter/material.dart';
import 'package:flutter_image_map/flutter_image_map.dart';
import 'package:game_map/cooridinates.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ImageMapExample();
  }
}

class ImageMapExample extends State<MyApp> {
  static List points = Coordinates.mapCoordinates;

  final List<Path> polygonRegions = points.map((e) {
    Path p = Path();
    p.addPolygon(e, true);
    return p;
  }).toList();
  final List<Color> colors =
      List.generate(points.length, (index) => Colors.transparent);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("flutter_image_map Example")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InteractiveViewer(
                maxScale: 15.0,
                child: ImageMap(
                    imagePath: 'assets/gameMap.jpg',
                    imageSize: const Size(1200, 1016),
                    onTap: (i) {
                      colors[i] = colors[i] == Colors.transparent
                          ? Colors.red.withOpacity(0.7)
                          : Colors.transparent;
                      debugPrint(i.toString());
                      setState(() {});
                    },
                    regions: polygonRegions,
                    regionColors: colors),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
