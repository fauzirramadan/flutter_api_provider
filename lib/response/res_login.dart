// To parse this JSON data, do
//
//     final resLogin = resLoginFromJson(jsonString);

import 'dart:convert';

ResLogin resLoginFromJson(String str) => ResLogin.fromJson(json.decode(str));

String resLoginToJson(ResLogin data) => json.encode(data.toJson());

class ResLogin {
  ResLogin({
    this.token,
  });

  String? token;

  factory ResLogin.fromJson(Map<String, dynamic> json) => ResLogin(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
