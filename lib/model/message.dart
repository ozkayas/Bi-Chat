import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String content;
  final String idFrom;
  final String idTo;
  final DateTime timestamp;

  Message(
      {required this.content,
      required this.idFrom,
      required this.idTo,
      required this.timestamp});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
