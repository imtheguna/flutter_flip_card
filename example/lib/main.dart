import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final con = FlipCardController();
  final con1 = FlipCardController();
  final cong = GestureFlipCardController();
  final cong1 = GestureFlipCardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlipCards"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            GestureFlipCard(
              controller: cong1,
              axis: FlipAxis.vertical,
              enableController: true,
              animationDuration: const Duration(seconds: 3),
              frontWidget: Center(
                child: Container(
                  height: 200,
                  width: 140,
                  child: Image.asset(
                    'image/01.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              backWidget: Container(
                height: 200,
                width: 140,
                child: Image.asset(
                  'image/02.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Flip Bottom'),
              onPressed: () {
                // Flip the card programmatically

                cong.flipcard();
                cong1.flipcard();
              },
            ),
            GestureFlipCard(
              enableController: true,
              controller: cong,
              animationDuration: const Duration(milliseconds: 800),
              axis: FlipAxis.horizontal,
              frontWidget: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'image/011.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              backWidget: Container(
                width: 300,
                height: 200,
                child: Image.asset(
                  'image/11.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FlipCard(
              rotateSide: RotateSide.bottom,
              // onTapFlipping: false,
              axis: FlipAxis.horizontal,
              controller: con1,
              frontWidget: Center(
                child: Container(
                  height: 200,
                  width: 140,
                  child: Image.asset(
                    'image/01.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              backWidget: Container(
                height: 200,
                width: 140,
                child: Image.asset(
                  'image/02.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Flip Bottom'),
              onPressed: () {
                // Flip the card programmatically
                con1.flipcard();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            FlipCard(
              rotateSide: RotateSide.right,
              disableSplashEffect: false,
              splashColor: Colors.orange,
              onTapFlipping: true,
              axis: FlipAxis.vertical,
              controller: con,
              frontWidget: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'image/011.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              backWidget: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'image/11.jpg',
                    fit: BoxFit.contain,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Flip Right'),
              onPressed: () {
                // Flip the card programmatically
                con.flipcard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
