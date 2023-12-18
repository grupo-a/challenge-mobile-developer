import 'package:core_services/core_services.dart';
import '../../../../../environment_interface.dart';
import '../../domain/entities/student_entity.dart';

import '../../domain/datasources/student_datasource.dart';
import '../models/student_model.dart';

class StudentRemoteDataSourceImpl implements StudentRemoteDataSource {
  final CoreRequester coreRequester;

  StudentRemoteDataSourceImpl({required this.coreRequester});

  @override
  Future<void> deleteStudent(String params) async {
    var response = await coreRequester.delete(
      url: '${EnvironmentInterface.api}/student/$params',
      fromJson: (value) {},
      fromJsonError: (value) => value,
    );

    return response;
  }

  @override
  Future<List<StudentModel>> fetchStudents() async {
    var response = await coreRequester.fetch(
      url: '${EnvironmentInterface.api}/student',
      fromJson: (value) {
        value = value as List;
        var list = value.map((e) => StudentModel.fromMap(e)).toList();
        return list;
      },
      fromJsonError: (value) => value,
    );

    return response;
  }

  @override
  Future<StudentModel> getStudent(String params) async {
    var response = await coreRequester.fetch(
      url: '${EnvironmentInterface.api}/student/$params',
      fromJson: (value) => StudentModel.fromMap(value),
      fromJsonError: (value) => value,
    );

    return response;
  }

  @override
  Future<StudentModel> postStudent(StudentEntity params) async {
    var response = await coreRequester.post(
      url: '${EnvironmentInterface.api}/student',
      body: params.toJson(),
      fromJson: (value) => StudentModel.fromMap(value),
      fromJsonError: (value) => value,
    );

    return response;
  }

  @override
  Future<StudentModel> putStudent(StudentEntity params) async {
    var response = await coreRequester.put(
      url: '${EnvironmentInterface.api}/student/${params.id}',
      body: params.toJson(),
      fromJson: (value) => StudentModel.fromMap(value),
      fromJsonError: (value) => value,
    );

    return response;
  }
}
