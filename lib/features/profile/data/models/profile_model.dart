class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String? profilePicture;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.profilePicture,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
    };
  }
}
