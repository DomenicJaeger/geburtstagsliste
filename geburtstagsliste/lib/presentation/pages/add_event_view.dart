import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/models/event.dart';
import 'package:geburtstagsliste/presentation/pages/subjects_view.dart';
import '../../main.dart';
import '../widgets/bottomNavigation.dart';

class AddEventView extends ConsumerWidget {
  const AddEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Create TextEditinControllers for managing the title and subjectID inputs
    TextEditingController titleController = TextEditingController();
    TextEditingController subjectIdController = TextEditingController();

    // Initialize a variable to store the selected date
    DateTime? chosenDate;
    //Access the reminderAppStateProvider using the watch method
    final provider = ref.watch(refReminderAppStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            //Create a TextFormField for entering the event title
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              maxLength: 16,
            ),

            const SizedBox(height: 16.0),
            //Add a TextButton to trigger the date picker dialog
            TextButton(
                child: const Text('add Date'),
                onPressed: () async {
                  //show the date picker and store the selected date
                  chosenDate =
                      await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1970, 1, 1), lastDate: DateTime(2070, 1, 1));
                }),

            //Create a TextFormField for entering the event title
            const SizedBox(height: 16.0),
            TextFormField(
              controller: subjectIdController,
              decoration: const InputDecoration(labelText: 'subjectID'),
            ),
            const SizedBox(
              height: 16.0,
            ),

            //Create an ElevatedButton to submit the event data
            ElevatedButton(
              onPressed: () {
                //Extract the title and subject ID from the controllers
                String title = titleController.text;
                String subjectId = subjectIdController.text;
                //Check if a date was selected and create an Event object
                if (chosenDate != null) {
                  //Add the event to the global app state using the provider
                  provider.addEvent(Event(title: title, date: chosenDate!, subjectId: subjectId));
                }

                //Navigate to the SubectsView page after submitting the event
                //should later be changed to the SingleSubjectView of the id
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SubjectsView()));
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
