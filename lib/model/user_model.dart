class UserModel {
  final String name;
  final String email;
  final String userProflile;
  final List follower;
  final List following;
  final String uid;

  UserModel({
    required this.email,
    required this.name,
    required this.userProflile,
    required this.follower,
    required this.following,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'profile': userProflile,
        'follower': follower,
        'following': following,
      };
}
