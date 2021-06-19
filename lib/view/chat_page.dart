import 'dart:io';

import 'package:bi_chat_app/model/message.dart';
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
  Database db = Database();

  @override
  void initState() {
    super.initState();
    isLoading = false;
    imageUrl = '';
    userId = widget.userId;
    if (widget.userId == Constants.passwordOne) {
      id = Constants.userOneID;
      peerId = Constants.userTwoID;
    } else {
      id = Constants.userTwoID;
      peerId = Constants.userOneID;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StreamBuilder<List<Message>>(
                  stream: db.messagesFromDb(1),
                  builder: (context, snapshot) {
                    return (snapshot.hasData)
                        ? ListView(
                            children: [Text(snapshot.data!.first.content)],
                          )
                        : Center(child: CircularProgressIndicator());
                  }),
            ),
            Container(
              height: 50.0,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}
