class RoomModel {
  final int id;
  final String name;
  final int length;
  final int width;
  final int height;
  final int userId;

  RoomModel({
    required this.id,
    required this.name,
    required this.length,
    required this.width,
    required this.height,
    required this.userId,
  });

  List<Object?> get props => <Object?>[
        id,
        name,
        length,
        width,
        height,
        userId,
      ];
}
