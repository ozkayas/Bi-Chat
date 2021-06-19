// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    content: json['content'] as String,
    idFrom: json['idFrom'] as String,
    idTo: json['idTo'] as String,
    timestamp:
        const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'content': instance.content,
      'idFrom': instance.idFrom,
      'idTo': instance.idTo,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };
