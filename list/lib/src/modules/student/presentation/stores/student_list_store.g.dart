// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentListStore on StudentListStoreBase, Store {
  late final _$studentListStateAtom =
      Atom(name: 'StudentListStoreBase.studentListState', context: context);

  @override
  StudentListStates get studentListState {
    _$studentListStateAtom.reportRead();
    return super.studentListState;
  }

  @override
  set studentListState(StudentListStates value) {
    _$studentListStateAtom.reportWrite(value, super.studentListState, () {
      super.studentListState = value;
    });
  }

  late final _$studentsAtom =
      Atom(name: 'StudentListStoreBase.students', context: context);

  @override
  List<StudentEntity> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(List<StudentEntity> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  late final _$fetchStudentsAsyncAction =
      AsyncAction('StudentListStoreBase.fetchStudents', context: context);

  @override
  Future<void> fetchStudents() {
    return _$fetchStudentsAsyncAction.run(() => super.fetchStudents());
  }

  late final _$deleteStudentAsyncAction =
      AsyncAction('StudentListStoreBase.deleteStudent', context: context);

  @override
  Future<void> deleteStudent(String studentId) {
    return _$deleteStudentAsyncAction.run(() => super.deleteStudent(studentId));
  }

  @override
  String toString() {
    return '''
studentListState: ${studentListState},
students: ${students}
    ''';
  }
}
