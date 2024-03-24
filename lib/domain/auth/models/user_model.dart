// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/widgets.dart';

class UserModel {
  final String? fullname;
  final String? username;
  final String? email;
  final String? country;
  final String? id;
  final String? phone;

  final String? phone_country;
  final String? avatar;

  UserModel(
      {this.fullname,
      this.username,
      this.email,
      this.country,
      this.id,
      this.phone,
      this.phone_country,
      this.avatar});

  UserModel copyWith({
    ValueGetter<String?>? fullname,
    ValueGetter<String?>? username,
    ValueGetter<String?>? email,
    ValueGetter<String?>? country,
    ValueGetter<String?>? id,
    ValueGetter<String?>? phone,
    ValueGetter<String?>? phone_country,
    ValueGetter<String?>? avatar,
  }) {
    return UserModel(
      fullname: fullname != null ? fullname() : this.fullname,
      username: username != null ? username() : this.username,
      email: email != null ? email() : this.email,
      country: country != null ? country() : this.country,
      id: id != null ? id() : this.id,
      phone: phone != null ? phone() : this.phone,
      phone_country:
          phone_country != null ? phone_country() : this.phone_country,
      avatar: avatar != null ? avatar() : this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'username': username,
      'email': email,
      'country': country,
      'id': id,
      'phone': phone,
      'phone_country': phone_country,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        fullname: map['fullname'],
        username: map['username'],
        email: map['email'],
        country: map['country'],
        id: map['id'],
        phone: map['phone'],
        phone_country: map['phone_country'],
        avatar: map['avatar']);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(fullname: $fullname, username: $username, email: $email, country: $country, id: $id, phone: $phone, phone_country: $phone_country, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.fullname == fullname &&
        other.username == username &&
        other.email == email &&
        other.country == country &&
        other.id == id &&
        other.phone == phone &&
        other.phone_country == phone_country &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return fullname.hashCode ^
        username.hashCode ^
        email.hashCode ^
        country.hashCode ^
        id.hashCode ^
        phone.hashCode ^
        phone_country.hashCode ^
        avatar.hashCode;
  }
}
