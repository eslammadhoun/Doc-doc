import 'package:cloud_firestore/cloud_firestore.dart';

class ParticipantInfo {
  final String? name;
  final String? photo;
  final String? role;

  const ParticipantInfo({this.name, this.photo, this.role});

  factory ParticipantInfo.fromMap(Map<String, dynamic> map) {
    return ParticipantInfo(
      name: map['name'] as String?,
      photo: map['photo'] as String?,
      role: map['role'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'photo': photo, 'role': role};
  }
}

class ConversationModel {
  final String id;
  final Map<String, ParticipantInfo> participants;
  final String? lastMessage;
  final String? lastMessageSenderId;
  final DateTime? lastMessageAt;
  final Map<String, int> unreadCount;

  const ConversationModel({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.lastMessageSenderId,
    this.lastMessageAt,
    required this.unreadCount,
  });

  static String buildId(String userIdA, String userIdB) {
    final List<String> sorted = [userIdA, userIdB]..sort();
    return '${sorted[0]}_${sorted[1]}';
  }

  factory ConversationModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final Map<String, dynamic> data = doc.data() ?? {};
    final Map<String, dynamic> participantsMap =
        (data['participants'] as Map<String, dynamic>?) ?? {};
    final Map<String, dynamic> unreadCountMap =
        (data['unreadCount'] as Map<String, dynamic>?) ?? {};

    return ConversationModel(
      id: doc.id,
      participants: participantsMap.map(
        (key, value) => MapEntry(
          key,
          ParticipantInfo.fromMap(value as Map<String, dynamic>),
        ),
      ),
      lastMessage: data['lastMessage'] as String?,
      lastMessageSenderId: data['lastMessageSenderId'] as String?,
      lastMessageAt: (data['lastMessageAt'] as Timestamp?)?.toDate(),
      unreadCount: unreadCountMap.map(
        (key, value) => MapEntry(key, (value as num).toInt()),
      ),
    );
  }

  String? otherParticipantId(String currentUserId) {
    final ids = participants.keys.where((id) => id != currentUserId);
    return ids.isEmpty ? null : ids.first;
  }

  ParticipantInfo? otherParticipant(String currentUserId) {
    final otherId = otherParticipantId(currentUserId);
    if (otherId == null) return null;
    return participants[otherId];
  }
}
