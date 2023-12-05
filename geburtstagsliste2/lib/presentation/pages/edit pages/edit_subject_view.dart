import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:geburtstagsliste/presentation/pages/subjects_view.dart';
import '../../../models/subject.dart';
import '../../widgets/bottomNavigation.dart';

//This class represents the view for editing a subject
class EditSubjectView extends ConsumerWidget {
  final Subject subject;
  final nameController = TextEditingController();
  // Constructor for the EditSubjectView widget
  EditSubjectView({required this.subject, Key? key}) : super(key: key) {
    nameController.text = subject.name;
  }

  // Build the widget's UI
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('Editing subject: ${subject.name} ${subject.id}');
    // Access the provider responsible for managing subjects
    final provider = ref.watch(refReminderAppStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Subject'),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Create a TextFormField to capture the subject name
            TextFormField(
              controller: nameController,
              autofocus: true, // Set autofocus for the input field
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Edit Subject Name'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            // Create an ElevatedButton to submit the edited subject
            ElevatedButton(
              onPressed: () {
                final newName = nameController.text;
                final updatedSubject = subject.copyWith(name: newName);
                provider.editSubject(updatedSubject);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SubjectsView(),
                  ),
                );
              },
              child: const Text('Submit Changes'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
