import 'package:bi_chat_app/constants.dart';
import 'package:bi_chat_app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

///This service is responsible to reach FirebaseFirestore and Storage as database
///Returns a Stream<List<Message>>
class Database {
  Stream<List<Message>> messagesFromDb(int limit) {
    print("------> messgesFromDb called");
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = firestore
        .collection(Constants.rootPath)
        .orderBy('timestamp')
        .limit(limit)
        .snapshots();
    var streamQuerySnapshot =
        querySnapshot.map((querySnapshot) => querySnapshot.docs);

    var streamListMessage = streamQuerySnapshot.map((listOfDS) => listOfDS
        .map((docSnapshot) => Message.fromJson(docSnapshot.data()))
        .toList());
    //Try to print the first message to check if it's there.
    //streamListMessage.first.then((value) => print(value.first.content));
    return streamListMessage;
    //return [];
  }

  void getOneMessage() async {
    var response = await FirebaseFirestore.instance
        .collection(Constants.rootPath)
        .doc('001')
        .get();

    if (response.exists) {
      var map = response.data();
      if (map != null) {
        var message = Message.fromJson(map);
        print(message.content);
        print(message.timestamp.toIso8601String());
      }
    }
  }
}
