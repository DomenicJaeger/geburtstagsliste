import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:geburtstagsliste/presentation/pages/home_view.dart';

import '../../models/subject.dart';
import '../widgets/bottomNavigation.dart';

class AddSubjectView extends ConsumerWidget {
  const AddSubjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController();
    TextEditingController idController = TextEditingController();

    final provider = ref.watch(refReminderAppStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Subject'),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Subject Name'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'Subject ID'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String id = idController.text;

                provider.addSubject(Subject(name: name, id: id));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
