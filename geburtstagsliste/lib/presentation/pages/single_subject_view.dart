import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:geburtstagsliste/presentation/pages/add%20pages/add_event_view.dart';
import 'package:geburtstagsliste/presentation/widgets/bottomNavigation.dart';
import '../../models/event.dart';
import '../../models/subject.dart';

class SingleSubjectView extends ConsumerWidget {
  final Subject subject;
  const SingleSubjectView({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Filter the events to only show those for the current subject
    // ignore: unused_local_variable
    // Get the provider for the app state
    final provider = ref.watch(refReminderAppStateProvider.notifier);
    final state = ref.watch(refReminderAppStateProvider);
    List<Event> filteredEvents = state.events.where((event) => event.subjectId == subject.id).toList();
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
          return Slidable(
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
                  provider.deleteEvent(event);
                }),
                backgroundColor: Colors.red,
                label: 'Delete',
                icon: Icons.delete,
              ),
            ]),
            child: ListTile(
              title: Text(event.title),
              //Display the date of the event in a formated string
              subtitle: Text('${event.date.day}.${event.date.month}.${event.date.year}'),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
