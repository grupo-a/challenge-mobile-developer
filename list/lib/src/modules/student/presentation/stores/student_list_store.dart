import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lists_joao_nogueira/global_instance.dart';
import '../../domain/entities/student_entity.dart';
import '../../domain/usecases/delete_student_use_case.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/erase_student_use_case.dart';
import '../../domain/usecases/fetch_students_use_case.dart';
import '../../domain/usecases/save_students_use_case.dart';

part 'student_list_store.g.dart';

enum StudentListStates { initial, loading, success, failure }

class StudentListStore = StudentListStoreBase with _$StudentListStore;

abstract class StudentListStoreBase with Store {
  late final DeleteStudentUseCase deleteStudentUseCase;
  late final EraseStudentUseCase eraseStudentUseCase;
  late final FetchStudentsUseCase fetchStudentsUseCase;
  late final SaveStudentsUseCase saveStudentsUseCase;

  StudentListStoreBase()
      : deleteStudentUseCase = sl.get<DeleteStudentUseCase>(),
        eraseStudentUseCase = sl.get<EraseStudentUseCase>(),
        fetchStudentsUseCase = sl.get<FetchStudentsUseCase>(),
        saveStudentsUseCase = sl.get<SaveStudentsUseCase>();

  @observable
  StudentListStates studentListState = StudentListStates.initial;

  @observable
  List<StudentEntity> students = [];

  String error = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final searchController = TextEditingController(text: '');

  void dispose() {
    searchController.dispose();
  }

  @action
  Future<void> fetchStudents() async {
    studentListState = StudentListStates.loading;
    var list = await fetchStudentsUseCase.execute();
    list.fold((success) {
      students = success;
      _saveList();
      studentListState = StudentListStates.success;
    }, (error) {
      this.error = error.toString();
      log('Fetch students error', error: error);
      studentListState = StudentListStates.failure;
    });
  }

  Future<void> _saveList() async {
    await saveStudentsUseCase.call(students);
  }

  @action
  Future<void> deleteStudent(String studentId) async {
    studentListState = StudentListStates.loading;
    var result = await deleteStudentUseCase.call(studentId);
    result.fold((success) {
      students.removeWhere((element) => element.id == studentId);
      _eraseStudent(studentId);
      studentListState = StudentListStates.initial;
    }, (error) {
      this.error = error.toString();
      log('Delete student error', error: error);
      studentListState = StudentListStates.failure;
    });
  }

  Future<void> _eraseStudent(String studentId) async {
    await eraseStudentUseCase.call(studentId);
  }
}
