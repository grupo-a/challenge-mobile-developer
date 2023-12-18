import 'package:flutter/material.dart';
import '../../domain/entities/student_entity.dart';

class StudentCard extends StatelessWidget {
  final StudentEntity student;
  final void Function(String) onEdit;
  final void Function(String) onDelete;

  const StudentCard({
    super.key,
    required this.student,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  student.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  student.academicRecord ?? '',
                ),
                Text(
                  'CPF: ${student.cpf ?? ''}',
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  onEdit(student.id ?? '');
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  onDelete(student.id ?? '');
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}
