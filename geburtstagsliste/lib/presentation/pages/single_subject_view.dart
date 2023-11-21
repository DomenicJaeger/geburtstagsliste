import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:geburtstagsliste/presentation/pages/add_event_view.dart';
import 'package:geburtstagsliste/presentation/widgets/bottomNavigation.dart';
import '../../models/event.dart';
import '../../models/subject.dart';

class SingleSubjectView extends ConsumerWidget {
  final Subject subject;
  final List<Event> events;
  const SingleSubjectView({Key? key, required this.subject, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Filter the events to only show those for the current subject
    List<Event> filteredEvents = events.where((event) => event.subjectId == subject.id).toList();
    // ignore: unused_local_variable
    // Get the provider for the app state
    final provider = ref.watch(refReminderAppStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: ListView.builder(
        itemCount: filteredEvents.length,
        itemBuilder: (context, index) {
          // Get the event at the current index
          final event = filteredEvents[index];
          return ListTile(
            title: Text(event.title),
            //Display the date of the event in a formated string
            subtitle: Text('${event.date.day}.${event.date.month}.${event.date.year}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              // Delete the event when the delete icon is tapped
              onPressed: () {
                provider.deleteEvent(event);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        // Open the add event view when the floating action button is tapped
        onPressed: () {
          String subjectId = subject.id;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEventView(subjectId: subjectId),
            ),
          );
        },
      ),
    );
  }
}
