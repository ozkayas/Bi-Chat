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

    return streamListMessage;
    //return [];
  }
}
