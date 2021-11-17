// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:permission_handler/permission_handler.dart";
import "dart:async";

class GetContact extends StatefulWidget {
  const GetContact({Key? key}) : super(key: key);

  @override
  _GetContactState createState() => _GetContactState();
}

class _GetContactState extends State<GetContact> {
  List<Contact> contact = [];
  Future<bool> getContactPermission() async {
    var res = await Permission.contacts.request();
    if (res == PermissionStatus.granted) {
      contact = await FlutterContacts.getContacts(
        withPhoto: true,
        withProperties: true,
        withAccounts: true,
      );

      return true;
    } else if (res == PermissionStatus.denied) {
      return false;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: Container(
          child: FutureBuilder(
              future: getContactPermission(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var res = snapshot.data;
                  if (res == true) {
                    return Scrollbar(
                      child: ListView.builder(
                          itemCount: contact.length,
                          itemBuilder: (context, i) {
                            // print("phone--------------------");
                            // print(contact[i].phones.length);

                            return Card(
                              child: ListTile(
                                title: Text(contact[i].displayName),
                                // leading: MyAvatar(
                                //   contact: contact[i],
                                // ),
                                subtitle: contact[i].phones.isNotEmpty
                                    ? Text(contact[i].phones[0].number)
                                    : Text(""),
                                trailing: IconButton(
                                  onPressed: () async {
                                    contact[i].displayName =
                                        "${contact[i].displayName} update";
                                    contact[i].name.first = "update";
                                    contact[i].phones[0].number = "0001";
                                    contact[i].update();

                                    print("update effectuer");
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                  return Text("veiller activer les permissions");
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}

class MyAvatar extends StatefulWidget {
  final Contact? contact;
  const MyAvatar({Key? key, this.contact}) : super(key: key);

  @override
  _MyAvatarState createState() => _MyAvatarState();
}

class _MyAvatarState extends State<MyAvatar> {
  // Future<Uint8List?> getAvatar() async {
  //   if (widget.contact != null) {
  //     var res = await FlutterContacts.(widget.contact!);
  //     return res;
  //   } else {
  //     return null;
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.contact!.photo!);
    return widget.contact != null
        ? CircleAvatar(backgroundImage: MemoryImage(widget.contact!.photo!))
        : Text("null");
  }
}
