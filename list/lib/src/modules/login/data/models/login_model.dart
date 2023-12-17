// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/login_entity.dart';

class LoginModel implements LoginEntity {
  @override
  final String? email;
  @override
  final String? password;
  @override
  final int? id;
  @override
  final String? token;
  @override
  final DateTime? createdAt;

  LoginModel({
    this.email,
    this.password,
    this.id,
    this.token,
    this.createdAt,
  });

  LoginModel copyWith({
    String? email,
    String? password,
    int? id,
    String? token,
    DateTime? createdAt,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
      token: token ?? this.token,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'id': id,
      'token': token,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      token: map['token'] != null ? map['token'] as String : null,
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int) : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

}
