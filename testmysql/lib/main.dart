// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers, avoid_print, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:testmysql/connection.dart';
import 'package:testmysql/inscription.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // precacheImage(AssetImage('asset/3.jpg'), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConIns(),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      title: "testMysql",
      routes: {
        "/connexion": (context) => Connexion(),
        "/inscription": (context) => Inscription(),
      },
    );
  }
}

class ConIns extends StatefulWidget {
  const ConIns({Key? key}) : super(key: key);

  @override
  _ConInsState createState() => _ConInsState();
}

class _ConInsState extends State<ConIns> {
  var theImg = Image.asset(
    "asset/1.jpg",
    fit: BoxFit.cover,
  );

  @override
  void didChangeDependencies() {
    // precacheImage(theImg.image, context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: theImg,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: const [
                        Text(
                          "Bienvenue chez LogementCI",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "Vous logez, notre objectif !",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Connexion();
                              }),
                            );
                          },
                          child: connexionButton(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Inscription();
                              }),
                            );
                          },
                          child: inscriptionButton(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget connexionButton() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "Connexion",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget inscriptionButton() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.grey),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "Inscription",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
