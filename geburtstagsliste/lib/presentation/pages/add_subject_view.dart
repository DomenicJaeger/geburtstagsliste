import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:geburtstagsliste/presentation/pages/home_view.dart';
import 'package:uuid/uuid.dart';
import '../../models/subject.dart';
import '../widgets/bottomNavigation.dart';

class AddSubjectView extends ConsumerWidget {
  const AddSubjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController();

    final provider = ref.watch(refReminderAppStateProvider.notifier);
    var uuid = Uuid();
    var newUuid = uuid.v4();

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
              autofocus: true,
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Subject Name'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String id = newUuid;

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
