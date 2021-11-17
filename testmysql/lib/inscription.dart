// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import "package:flutter/material.dart";
import 'package:testmysql/constante.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(1),
              BlendMode.dstATop,
            ),
            image: AssetImage('asset/facebook.JPG'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: Center(
                      child: Icon(
                        Icons.house_rounded,
                        color: Colors.white,
                        size: 100.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nom complet",
                        style: style,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.white,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Theme(
                                data: ThemeData(colorScheme: colorScheme),
                                child: TextFormField(
                                  onChanged: (value) {},
                                  obscureText: false,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    hintText: "Kone Stephane",
                                    hintStyle: hintextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 24.0,
                      ),
                      Text(
                        "Email",
                        style: style,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.white,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Theme(
                                data: ThemeData(colorScheme: colorScheme),
                                child: TextFormField(
                                  onChanged: (value) {},
                                  obscureText: false,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    hintText: "eze@gmail.com",
                                    hintStyle: hintextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        "Mot de passe",
                        style: style,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.white,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Theme(
                                data: ThemeData(
                                  colorScheme: colorScheme,
                                ),
                                child: TextFormField(
                                  onChanged: (value) {},
                                  obscureText: false,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    hintText: "********",
                                    hintStyle: hintextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      inscriptionButton(),
                      SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Vous avez déja un compte? ",
                              style: style,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                "/connexion",
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("Connection", style: style),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inscriptionButton() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.grey),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            "Inscription",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
