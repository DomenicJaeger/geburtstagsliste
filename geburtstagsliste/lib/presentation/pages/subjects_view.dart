import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/presentation/pages/add%20pages/add_subject_view.dart';
import 'package:geburtstagsliste/presentation/widgets/subject_card.dart';

import '../../models/subject.dart';
import '../widgets/bottomNavigation.dart';

class SubjectsView extends ConsumerWidget {
  const SubjectsView({Key? key}) : super(key: key);

  // This widget displays a list of subjects and a bottom navigation bar
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieve the current state from the Riverpod provider
    final provider = ref.watch(refReminderAppStateProvider.notifier);
    final state = ref.watch(refReminderAppStateProvider);
    final sortedSubjects = List<Subject>.from(state.subjects)..sort((a, b) => a.name.compareTo(b.name));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: Padding(
        // padding: const EdgeInsets.only(left: 8.0, top:8.0, right: 8.0, bottom: 32.0),
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // Iterate over the list of subjects and create a new SubjectCard widget for each one
            for (final subject in sortedSubjects)
              Slidable(
                startActionPane: ActionPane(motion: DrawerMotion(), children: [
                  SlidableAction(
                    onPressed: ((context) {
                      // do something
                    }),
                    backgroundColor: Colors.blue,
                    label: 'notes',
                    icon: Icons.comment_rounded,
                  ),
                  SlidableAction(
                    onPressed: ((context) {
                      // do something
                    }),
                    backgroundColor: Colors.green,
                    label: 'Edit',
                    icon: Icons.edit,
                  ),
                ]),
                endActionPane: ActionPane(motion: DrawerMotion(), children: [
                  SlidableAction(
                    onPressed: ((context) {
                      provider.deleteSubject(subject);
                    }),
                    backgroundColor: Colors.red,
                    label: 'Delete',
                    icon: Icons.delete,
                  ),
                ]),
                child: SubjectCard(
                  subject: subject,
                ),
              )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        // Open the add event view when the floating action button is tapped
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddSubjectView(),
            ),
          );
        },
      ),
    );
  }
}
