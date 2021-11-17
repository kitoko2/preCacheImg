// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'dart:async';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:radio_player/radio_player.dart';

class RadioApp extends StatefulWidget {
  const RadioApp({Key? key}) : super(key: key);

  @override
  _RadioAppState createState() => _RadioAppState();
}

class _RadioAppState extends State<RadioApp> {
  RadioPlayer radioPlayer = RadioPlayer();
  final StreamController<int> streamController = StreamController<int>();
  int count = 0;
  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          streamController.sink.add(0);
        },
      ),
      body: StreamProvider<int>.value(
        initialData: 1,
        value: streamController.stream,
        child: Next(),
        //       child: Center(
        //   child: Container(

        //     // child: Column(
        //     //   mainAxisAlignment: MainAxisAlignment.center,
        //     //   children: [
        //     //     TextButton(
        //     //       onPressed: () {
        //     //         radioPlayer.setMediaItem(
        //     //           "myradio",
        //     //           "http://radioclassique.ice.infomaniak.ch/radioclassique-high.mp3",
        //     //         );
        //     //         radioPlayer.play();
        //     //       },
        //     //       child: Text("play"),
        //     //     )
        //     //   ],
        //     // ),
        //   ),
        // ),
      ),
    );
  }
}

class Next extends StatefulWidget {
  const Next({Key? key}) : super(key: key);

  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {
  @override
  Widget build(BuildContext context) {
    final res = Provider.of<int>(context);
    return res == 0
        ? Container(
            child: Center(
              child: Text("AHAHAHHAHA 0"),
            ),
          )
        : Center(
            child: Text("$res"),
          );
  }
}
