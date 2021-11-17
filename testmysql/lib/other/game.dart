// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, avoid_print

import 'dart:async';
import 'dart:math';

import "package:flutter/material.dart";

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int nbrSelectionner = 1;
  bool lance = false;
  start() {
    setState(() {
      lance = true;
    });
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        lance = false;
        print("end.......");
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 80), (timer) {
      if (lance) {
        setState(() {
          Random r = Random();
          nbrSelectionner = r.nextInt(25);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              lance ? "..." : "LE SCORE EST : $nbrSelectionner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 25,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  // mainAxisExtent: 20,
                ),
                itemBuilder: (context, i) {
                  return Container(
                    width: 50,
                    height: 50,
                    child: Center(child: Text("${i + 1}")),
                    decoration: BoxDecoration(
                      color: nbrSelectionner == i + 1
                          ? Colors.green
                          : Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                start();
              },
              child: Text("start"),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
