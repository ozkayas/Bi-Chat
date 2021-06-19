import 'package:bi_chat_app/model/message.dart';
import 'package:flutter/material.dart';

class BubbleCard extends StatelessWidget {
  final Message message;
  final String userId;
  const BubbleCard({Key? key, required this.message, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Choose color according to userId
    Color _color = message.idFrom == userId
        ? Colors.lightBlue.shade600
        : Colors.grey.shade400;
    Alignment _alignment =
        message.idFrom == userId ? Alignment.centerRight : Alignment.centerLeft;
    Color _textColor = message.idFrom == userId ? Colors.white : Colors.black;
    EdgeInsets _margin = message.idFrom == userId
        ? EdgeInsets.only(left: 50, right: 10, top: 4, bottom: 4)
        : EdgeInsets.only(left: 10, right: 50, top: 4, bottom: 4);

    return Container(
        alignment: _alignment,
        child: Text(
          message.content,
          style: TextStyle(fontSize: 20, color: _textColor),
        ),
        //width: 200.0,
        margin: _margin,
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        decoration: BoxDecoration(
            color: _color, borderRadius: BorderRadius.circular(10.0)));
  }
}
