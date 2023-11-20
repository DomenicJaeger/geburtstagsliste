import 'package:flutter/material.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/presentation/widgets/subject_card.dart';

import '../widgets/bottomNavigation.dart';

class SubjectsView extends ConsumerWidget {
  const SubjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(refReminderAppStateProvider);
    state.subjects.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            for (final subject in state.subjects)
              SubjectCard(
                subject: subject,
              )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
