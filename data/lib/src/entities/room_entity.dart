import 'package:cloud_firestore/cloud_firestore.dart';

class RoomEntity {
  final String id;
  final String name;
  final int length;
  final int width;
  final int height;
  final int userId;

  RoomEntity({
    required this.id,
    required this.name,
    required this.length,
    required this.width,
    required this.height,
    required this.userId,
  });

  factory RoomEntity.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final Map<String, dynamic> data = doc.data()!;
    return RoomEntity(
      id: data['id'] as String,
      name: data['name'] as String,
      width: data['width'] as int,
      length: data['length'] as int,
      height: data['height'] as int,
      userId: data['userId'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'width': width,
      'length': length,
      'height': height,
      'userId': userId,
    };
  }
}
