abstract class StudentEntity {
  final String? email;
  final String? name;
  final String? id;
  final String? cpf;
  final String? academicRecord;
  final DateTime? createdAt;
  final DateTime? birthdate;


  StudentEntity({
    this.email,
    this.name,
    this.id,
    this.cpf,
    this.createdAt,
    this.academicRecord,
    this.birthdate,
  });

  toJson() {}
}
