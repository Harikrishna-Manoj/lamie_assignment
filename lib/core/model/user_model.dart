class UserModel {
  int? id;
  String? username;
  String? email;
  String? profileImage;
  String? profileCoverImage;
  String? phoneNumber;
  bool? isGoogle;
  List<Connections>? connections;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.profileImage,
      this.profileCoverImage,
      this.phoneNumber,
      this.isGoogle,
      this.connections});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'];
    profileCoverImage = json['profile_cover_image'];
    phoneNumber = json['phone_number'];
    isGoogle = json['is_google'];
    if (json['connections'] != null) {
      connections = <Connections>[];
      json['connections'].forEach((v) {
        connections!.add(Connections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['profile_image'] = profileImage;
    data['profile_cover_image'] = profileCoverImage;
    data['phone_number'] = phoneNumber;
    data['is_google'] = isGoogle;
    if (connections != null) {
      data['connections'] = connections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Connections {
  int? id;
  String? username;
  String? email;
  String? profileImage;
  String? profileCoverImage;
  String? phoneNumber;
  bool? isGoogle;

  Connections(
      {this.id,
      this.username,
      this.email,
      this.profileImage,
      this.profileCoverImage,
      this.phoneNumber,
      this.isGoogle});

  Connections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'];
    profileCoverImage = json['profile_cover_image'];
    phoneNumber = json['phone_number'];
    isGoogle = json['is_google'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['profile_image'] = profileImage;
    data['profile_cover_image'] = profileCoverImage;
    data['phone_number'] = phoneNumber;
    data['is_google'] = isGoogle;
    return data;
  }
}
