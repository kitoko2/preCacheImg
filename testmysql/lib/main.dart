// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers, avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:testmysql/con_ins.dart';
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
    precacheImage(AssetImage('asset/3.jpg'), context);
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

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  bool first = true;

  inscription(String? email, String? pass, String? image) async {
    try {
      var url = Uri.parse("https://poyo200.000webhostapp.com/signup.php");

      var res = await http.post(
        url,
        body: {"email": email, "pass": pass, "image": image},
      );
      if (res.statusCode == 200) {
        var result = jsonDecode(res.body);
        print(result);
      }
      print(res.statusCode);
    } catch (e) {
      print(e.toString());
    }
  }

  bool load = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(first ? "Inscription" : "Connection"),
      ),
      body: SingleChildScrollView(
        child: load
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: "email",
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passcontroller,
                      decoration: InputDecoration(
                        hintText: "password",
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () async {},
                      child: Text(first ? "S'inscrire" : "Se connecter"),
                    ),
                    Row(
                      children: [
                        Text(
                          first
                              ? "Vous avez d'ja un compte?"
                              : " vous n'avez pas de compte?",
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              first = !first;
                            });
                          },
                          child: Text(first ? "se connecter" : "s'inscrire"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
