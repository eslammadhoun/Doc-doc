import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_complete_project/features/inbox/data/models/conversation_model.dart';
import 'package:flutter_complete_project/features/inbox/data/models/message_model.dart';

class InboxFirebase {
  final FirebaseFirestore firebaseFirestore;
  const InboxFirebase({required this.firebaseFirestore});

  Future<Stream<List<DocumentSnapshot<Map<String, dynamic>>>>>
  watchConversations({required String userId}) async {
    return firebaseFirestore
        .collection('Users')
        .doc(userId)
        .collection('conversations')
        .orderBy('lastMessageAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }

  Stream<List<DocumentSnapshot<Map<String, dynamic>>>> watchMessages({
    required String userId,
    required String conversationId,
  }) {
    return firebaseFirestore
        .collection('Users')
        .doc(userId)
        .collection('conversations')
        .doc(conversationId)
        .collection('messages')
        .orderBy('sentAt')
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }

  Future<void> sendMessage({
    required MessageModel message,
    required String conversationId,
    required String receiverId,
    required ParticipantInfo senderInfo,
    required ParticipantInfo receiverInfo,
  }) async {
    final batch = firebaseFirestore.batch();

    final senderConvRef = firebaseFirestore
        .collection('Users')
        .doc(message.senderId)
        .collection('conversations')
        .doc(conversationId);

    final receiverConvRef = firebaseFirestore
        .collection('Users')
        .doc(receiverId)
        .collection('conversations')
        .doc(conversationId);

    final Map<String, dynamic> conversationData = {
      'participants': {
        message.senderId: senderInfo.toMap(),
        receiverId: receiverInfo.toMap(),
      },
      'lastMessage': message.text,
      'lastMessageSenderId': message.senderId,
      'lastMessageAt': FieldValue.serverTimestamp(),
    };

    batch.set(senderConvRef, conversationData, SetOptions(merge: true));
    batch.set(receiverConvRef, conversationData, SetOptions(merge: true));

    final senderMsgRef = senderConvRef.collection('messages').doc();
    final receiverMsgRef = receiverConvRef
        .collection('messages')
        .doc(senderMsgRef.id);

    batch.set(senderMsgRef, message.toMap());
    batch.set(receiverMsgRef, message.toMap());

    await batch.commit();
  }
}
