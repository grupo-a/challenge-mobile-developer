import 'package:core_services/core_services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/material.dart';
import 'package:lists_joao_nogueira/list_app_routes.dart';
import '../stores/student_list_store.dart';
import '../widgets/student_card.dart';
import '../../../../../global_instance.dart';
import '../../../../utils/mixins/messages.dart';
import '../../../../utils/theme/theme_app.dart';

class StudentsListScreen extends StatefulWidget {
  const StudentsListScreen({
    super.key,
  });

  @override
  State<StudentsListScreen> createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> with Messages {
  late final StudentListStore store;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    store = sl<StudentListStore>();
    store.fetchStudents();
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
        floatingActionButton: TextButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: theme.primaryColor,
            padding: const EdgeInsets.all(10),
            elevation: 1,
          ),
          onPressed: () {
            NavigationService().navigateTo(ListAppRoutes.createStudent);
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: Text(
            Tr.of(
              context,
              "list.students.add_student",
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {},
          destinations: <Widget>[
            NavigationDestination(
              icon: const Icon(Icons.menu),
              label: Tr.of(
                context,
                "list.students.menu",
              ),
            ),
            NavigationDestination(
              icon: const Icon(Icons.help_outline_outlined),
              label: Tr.of(
                context,
                "list.students.help",
              ),
            ),
            NavigationDestination(
              icon: const Icon(Icons.notifications_outlined),
              label: Tr.of(
                context,
                "list.students.notifications",
              ),
            ),
            NavigationDestination(
              icon: const Icon(Icons.account_circle_outlined),
              label: Tr.of(
                context,
                "list.students.profile",
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: store.searchController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  filled: true,
                  label: Text(
                    Tr.of(
                      context,
                      "list.students.search",
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await store.fetchStudents();
                  },
                  child: Observer(builder: (context) {
                    if (store.studentListState == StudentListStates.loading) {
                      return const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        ),
                      );
                    }
                    if (store.studentListState == StudentListStates.failure) {
                      showError(store.error);
                      return const SizedBox();
                    }
                    return ListView.builder(
                      restorationId: 'student_list_view',
                      controller: scrollController,
                      itemCount: store.students.length,
                      itemBuilder: (context, index) {
                        return StudentCard(
                          student: store.students[index],
                          onEdit: (value) {},
                          onDelete: store.deleteStudent,
                        );
                      },
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
