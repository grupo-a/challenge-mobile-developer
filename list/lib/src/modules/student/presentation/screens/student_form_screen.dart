import 'package:core_services/core_services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/material.dart';
import '../stores/student_list_store.dart';
import '../widgets/student_card.dart';
import '../../../../../global_instance.dart';
import '../../../../utils/mixins/messages.dart';
import '../../../../utils/theme/theme_app.dart';

class StudentsFormScreen extends StatefulWidget {
  const StudentsFormScreen({
    super.key,
  });

  @override
  State<StudentsFormScreen> createState() => _StudentsFormScreenState();
}

class _StudentsFormScreenState extends State<StudentsFormScreen> with Messages {
  late final StudentListStore store;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    store = sl<StudentListStore>();
  }

  @override
  void dispose() {
    store.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Tr.of(
              context,
              "list.students.appbar",
            ),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: theme.primaryColor,
        ),
        backgroundColor: Colors.white,
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
