import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:group_chat_room_responsive/domain/entities/text_message_entity.dart';

class TextMessageModel extends TextMessageEntity {
  TextMessageModel({String recipientId, String senderId, String senderName,
      String type="TEXT", Timestamp time, String message, String receiverName})
      : super(recipientId, senderId, senderName, type, time, message, receiverName);

  factory TextMessageModel.fromJson(Map<String,dynamic> json){
    return TextMessageModel(
      recipientId: json['recipientId'],
      message:json['message'],
      time: json['time'],
      receiverName:json['receiverName'],
      senderId:json['senderId'],
      senderName:json['senderName'],
      type:json['type'],
    );
  }

  factory TextMessageModel.fromSnapshot(DocumentSnapshot documentSnapshot){
    return TextMessageModel(
      time: documentSnapshot['time'],
      message:documentSnapshot['message'],
      receiverName: documentSnapshot['receiverName'],
      recipientId: documentSnapshot['recipientId'],
      senderId:documentSnapshot['senderId'],
      senderName:documentSnapshot['senderName'],
      type:documentSnapshot['type'],
    );
  }

  Map<String,dynamic> toDocument(){
    return {
      "recipientId":recipientId,
      "senderId":senderId,
      "senderName":senderName,
      "type":type,
      "time":time,
      "message":message,
      "receiverName":receiverName
    };
  }
}
