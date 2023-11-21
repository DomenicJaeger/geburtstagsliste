import 'package:flutter/material.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/presentation/widgets/subject_card.dart';

import '../widgets/bottomNavigation.dart';

class SubjectsView extends ConsumerWidget {
  const SubjectsView({Key? key}) : super(key: key);

  // This widget displays a list of subjects and a bottom navigation bar
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieve the current state from the Riverpod provider
    final state = ref.watch(refReminderAppStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // Iterate over the list of subjects and create a new SubjectCard widget for each one
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
