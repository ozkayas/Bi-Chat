import 'dart:io';

import 'package:bi_chat_app/service/database_service.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatPage extends StatefulWidget {
  final String userId;
  const ChatPage({Key? key, required this.userId}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late String userId; //Şifreden gelen Id -> abc/xyz
  late String peerId; //Firebase mesaj ID'si --> 001/002
  late String id; //Firebase mesaj ID'si --> 001/002
  late File imageFile; //To Store Image from Camera or Gallery
  late bool isLoading;
  late String imageUrl; //ImageURL from firebase Storage ??

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
    Database db = Database();
    db.messagesFromDb(1);
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
