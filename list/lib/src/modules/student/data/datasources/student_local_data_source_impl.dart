import 'package:core_services/core_services.dart';
import 'package:lists_joao_nogueira/src/modules/student/data/models/student_model.dart';
import 'package:lists_joao_nogueira/src/modules/student/domain/entities/student_entity.dart';

import '../../domain/datasources/student_datasource.dart';

class StudentLocalDataSourceImpl implements StudentLocalDataSource {
  final CoreDatabaseInterface<StudentEntity> coreStorage;
  bool _initialized = false;

  StudentLocalDataSourceImpl({required this.coreStorage});

  Future<void> makeSureInitialized() async {
    if (_initialized) {
      return Future.value();
    } else {
      _initialized = true;
      await coreStorage.init('students', StudentModelAdapter());
    }
  }

  @override
  Future<void> eraseStudent(String params) async {
    await makeSureInitialized();
    await coreStorage.delete(params);
  }

  @override
  Future<void> saveStudent(StudentEntity params) async {
    await makeSureInitialized();
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
    await makeSureInitialized();
    var map = {for (var e in params) e.id: e};
    await coreStorage.clear();
    await coreStorage.saveAll(values: map);
  }

  @override
  Future<StudentEntity?> loadStudent(String params) async {
    await makeSureInitialized();
    return await coreStorage.get(key: params);
  }
}
