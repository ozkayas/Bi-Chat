import 'dart:io';

import 'package:flutter/material.dart';

import '../constants.dart';

class ChatPage extends StatefulWidget {
  final String userId;
  const ChatPage({Key key, this.userId}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String userId; //Şifreden gelen Id -> abc/xyz
  String peerId; //Firebase mesaj ID'si --> 001/002
  String id; //Firebase mesaj ID'si --> 001/002
  File imageFile; //To Store Image from Camera or Gallery
  bool isLoading;
  String imageUrl; //ImageURL from firebase Storage ??

  @override
  void initState() {
    super.initState();
    isLoading = false;
    imageUrl = '';
    userId = widget.userId;
    if (widget.userId == Constants.passwordOne) {
      id = '001';
      peerId = '002';
    } else {
      id = '002';
      peerId = '001';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 12,
              child: Container(
                color: Colors.grey,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                //height: 50.0,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
