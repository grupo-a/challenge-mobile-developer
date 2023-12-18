import 'package:core_services/core_services.dart';
import 'package:lists_joao_nogueira/src/modules/student/domain/entities/student_entity.dart';

import '../../domain/datasources/student_datasource.dart';

class StudentLocalDataSourceImpl implements StudentLocalDataSource {
  final CoreDatabaseInterface<StudentEntity> coreStorage;

  StudentLocalDataSourceImpl({required this.coreStorage});

  @override
  Future<void> eraseStudent(String params) async {
    await coreStorage.delete(params);
  }

  @override
  Future<void> saveStudent(StudentEntity params) async {
    StudentEntity? student = await coreStorage.get(key: params.id!);
    if (student == null) {
      await coreStorage.save(key: params.id!, value: params);
    } else {
      await coreStorage.delete(params.id!);
      await coreStorage.save(key: params.id!, value: params);
    }
  }

  @override
  Future<void> saveStudents(List<StudentEntity> params) async {
    var map = {for (var e in params) e.id: e};
    await coreStorage.clear();
    await coreStorage.saveAll(values: map);
  }

  @override
  Future<StudentEntity?> loadStudent(String params) async {
    return await coreStorage.get(key: params);
  }
}
