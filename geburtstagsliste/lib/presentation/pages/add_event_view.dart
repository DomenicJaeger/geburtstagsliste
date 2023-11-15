import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/models/event.dart';
//import 'package:geburtstagsliste/provider/reminder_app_state_provider.dart';
import '../../main.dart';
import '../widgets/bottomNavigation.dart';

//Creates a statelesswidget called AddEventView
class AddEventView extends ConsumerWidget {
  //Creates a constructor for the AddEventView class
  const AddEventView({Key? key}) : super(key: key);

  //builds the widget
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Creates three TextEditinControllers to manage the text in the TextFields
    TextEditingController titleController = TextEditingController();
    TextEditingController subjectIdController = TextEditingController();

    var chosenDate;
    final provider = ref.watch(refReminderAppStateProvider.notifier);

    // provider.addEvent(Event(title: title, date: date, subjectId: subjectId));

    //Returns a Scaffold widget
    return Scaffold(
      //Creates an Appbar with a title and a background color
      appBar: AppBar(
        title: const Text('Add Event'),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      //Creates a Container with a red background and padding
      body: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          //Creates a Column with four children
          child: Column(
            children: <Widget>[
              TextFormField(
                //Creates a TextFormField with a label and a controller
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                  child: const Text('add Date'),
                  onPressed: () async {
                    chosenDate =
                        await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1970, 1, 1), lastDate: DateTime(2070, 1, 1));
                  }),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: subjectIdController,
                decoration: const InputDecoration(labelText: 'subjectID'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              //Creates an ElevatedButton with a label and an onPressed method
              ElevatedButton(
                onPressed: () {
                  //Retrieves the text from the three TextFields
                  String title = titleController.text;
                  String subjectId = subjectIdController.text;
                  if (chosenDate != null) {
                    provider.addEvent(Event(title: title, date: chosenDate, subjectId: subjectId));
                  }
                  //Return to the last screen
                  Navigator.pop(context);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
