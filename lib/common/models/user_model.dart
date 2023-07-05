// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final int id;
  final int isVerified;

  UserModel({
    required this.id,
    required this.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    isVerified: json["isVerified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isVerified": isVerified,
  };
}
