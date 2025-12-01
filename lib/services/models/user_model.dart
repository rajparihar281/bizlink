class UserModel {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  // Factory constructor to create a User from JSON (Simulating backend response)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );
  }

  // Method to convert User to JSON (for sending to API)
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'avatarUrl': avatarUrl};
  }
}
