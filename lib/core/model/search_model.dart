import 'package:lamie_pro/core/model/user_model.dart';

class SearchModel {
  SearchModel({
    required this.id,
    required this.username,
    required this.email,
    required this.profileImage,
    required this.profileCoverImage,
    required this.phoneNumber,
    required this.isGoogle,
    required this.connections,
  });

  final int? id;
  final String? username;
  final String? email;
  final String? profileImage;
  final String? profileCoverImage;
  final String? phoneNumber;
  final bool? isGoogle;
  final List<Connections> connections;

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      profileImage: json["profile_image"],
      profileCoverImage: json["profile_cover_image"],
      phoneNumber: json["phone_number"],
      isGoogle: json["is_google"],
      connections: json["connections"] == null
          ? []
          : List<Connections>.from(
              json["connections"]!.map((x) => Connections.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "profile_image": profileImage,
        "profile_cover_image": profileCoverImage,
        "phone_number": phoneNumber,
        "is_google": isGoogle,
        "connections": connections.map((x) => x.toJson()).toList(),
      };
}
