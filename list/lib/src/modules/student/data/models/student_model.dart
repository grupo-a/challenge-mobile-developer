// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:core_services/core_services.dart';
import '../../domain/entities/student_entity.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel implements StudentEntity {
  @override
  @HiveField(0)
  final String? email;
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final String? id;
  @override
  @HiveField(3)
  final String? cpf;
  @override
  @HiveField(4)
  final String? academicRecord;
  @override
  @HiveField(5)
  final DateTime? createdAt;
  @override
  @HiveField(6)
  final DateTime? birthdate;
  StudentModel({
    this.email,
    this.name,
    this.id,
    this.cpf,
    this.academicRecord,
    this.createdAt,
    this.birthdate,
  });

  StudentModel copyWith({
    String? email,
    String? name,
    String? id,
    String? cpf,
    String? academicRecord,
    DateTime? createdAt,
    DateTime? birthdate,
  }) {
    return StudentModel(
      email: email ?? this.email,
      name: name ?? this.name,
      id: id ?? this.id,
      cpf: cpf ?? this.cpf,
      academicRecord: academicRecord ?? this.academicRecord,
      createdAt: createdAt ?? this.createdAt,
      birthdate: birthdate ?? this.birthdate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'id': id,
      'cpf': cpf,
      'academicRecord': academicRecord,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'birthdate': birthdate?.millisecondsSinceEpoch,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      academicRecord: map['academicRecord'] != null
          ? map['academicRecord'] as String
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      birthdate: map['birthdate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthdate'] as int)
          : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
