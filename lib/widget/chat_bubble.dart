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

    return Card(
      color: _color,
      child: Container(
          alignment: _alignment,
          child: Text(message.content,
              style: TextStyle(fontSize: 20, color: _textColor))),
    );
  }
}
