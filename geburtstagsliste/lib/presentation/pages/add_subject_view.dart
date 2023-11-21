import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:geburtstagsliste/presentation/pages/home_view.dart';
import 'package:uuid/uuid.dart';
import '../../models/subject.dart';
import '../widgets/bottomNavigation.dart';

//This class represents the view for adding a new subject
class AddSubjectView extends ConsumerWidget {
  // Constructor for the AddSubjectView widget
  const AddSubjectView({Key? key}) : super(key: key);

  // Build the widget's UI
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Create a TextEditingController to manage the input for the subject name
    TextEditingController nameController = TextEditingController();
    // Access the provider responsible for managing subjects
    final provider = ref.watch(refReminderAppStateProvider.notifier);
    // Generate a unique ID for the new subject
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
            // Create a TextFormField to capture the subject name
            TextFormField(
              autofocus: true, // Set autofocus for the input field
              controller: nameController, // Associate the controller with the field
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Subject Name'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            // Create an ElevatedButton to submit the new subject
            ElevatedButton(
              onPressed: () {
                // Extract the subject name from the controller
                String name = nameController.text;
                String id = newUuid;
                // Use the provider to add the new subject to the list
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
