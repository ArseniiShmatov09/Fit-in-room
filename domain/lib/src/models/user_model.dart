class UserModel {
  final String username;
  final String email;
  final String password;

  UserModel({
    required this.username,
    required this.email,
    required this.password,

  });

  List<Object?> get props => <Object?>[
    username,
    email,
    password,
  ];
}
