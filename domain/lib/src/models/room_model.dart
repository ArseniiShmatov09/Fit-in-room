class RoomModel {
  final String id;
  final String name;
  final int length;
  final int width;
  final int height;
  final String username;

  factory RoomModel.empty() {
    return RoomModel(
      id: '1',
      name: '',
      width: 0,
      length: 0,
      height: 0,
      username: '',
    );
  }

  RoomModel({
    required this.id,
    required this.name,
    required this.length,
    required this.width,
    required this.height,
    required this.username,
  });

  List<Object?> get props => <Object?>[
        id,
        name,
        length,
        width,
        height,
        username,
      ];
}
