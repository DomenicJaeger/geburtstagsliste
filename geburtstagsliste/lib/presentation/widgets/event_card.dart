import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:geburtstagsliste/models/event.dart';
import 'package:geburtstagsliste/presentation/pages/single_subject_view.dart';

import '../../models/subject.dart';

int daysUntilEvent(Event event) {
  //Get today's date and time
  DateTime today = DateTime.now();
  //Create a copy of today's date with the hour, minute and second set to 0
  DateTime todayAtMidnight = DateTime.now().copyWith(hour: 0, minute: 0, second: 0);
  //Create the date for the event in this year
  DateTime newDate = DateTime(today.year, event.date.month, event.date.day);
  //Create the date for the event in the next year
  DateTime newDateNextYear = DateTime(newDate.year + 1, newDate.month, newDate.day);

  if (newDate.isBefore(todayAtMidnight)) {
    return newDateNextYear.difference(todayAtMidnight).inDays + 1;
  } else {
    return newDate.difference(todayAtMidnight).inDays + 1;
  }
}

// A widget that dispplay a single event.
class EventCard extends ConsumerWidget {
  //The event to be displayed
  const EventCard({
    super.key,
    required this.event,
    required this.subject,
  });

  final Event event;
  final Subject subject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the 'refReminderAppStateProvider' provider form the widget tree.
    final stateProvider = ref.read(refReminderAppStateProvider.notifier);
    // Get the subject associated with the event from the state.
    final subject = stateProvider.getSubjectById(event.subjectId);
    // Get today's date and time.
    final today = DateTime.now();
    // Create the date for the event in this year.
    final newDate = DateTime(today.year, event.date.month, event.date.day);
    // Create the date for the event in the next year.
    final newDateNextYear = DateTime(newDate.year + 1, newDate.month, newDate.day);
    // Create a copy of today's date with the hour, minute microsecond and millisecond set to 0.
    final todayAtMidnight = today.copyWith(hour: 0, minute: 0, microsecond: 0, millisecond: 0);

    //Calculates the next age of the subject based on the event date.
    int nextAge2(Event event) {
      final int yearsDifference;
      bool isBeforeToday = newDate.isBefore(todayAtMidnight);

      if (isBeforeToday) {
        yearsDifference = todayAtMidnight.year - event.date.year + 1;
      } else {
        yearsDifference = todayAtMidnight.year - event.date.year;
      }
      return yearsDifference;
    }

    //Calculates the number of days until the event.
    int daysUntilEvent() {
      if (newDate.isBefore(todayAtMidnight)) {
        return newDateNextYear.difference(todayAtMidnight).inDays + 1;
      } else {
        return newDate.difference(todayAtMidnight).inDays + 1;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            // A widget that displays a container that can be tapped.
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.brown.shade100,
                  width: 1.0,
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.brown.shade100,
                              width: 1.0,
                            ),
                            color: Colors.lightBlue),
                        child: const Text('BILD'),
                      ),
                    ),
                    Column(
                      children: [
                        Text('${subject?.name ?? '---'} ${event.title}'),
                        Text('${event.date.day.toString()}/${event.date.month.toString()} wird ${nextAge2(event)} Jahre alt'),
                      ],
                    ),
                    SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blue,
                          ),
                          child: Text(
                            'in ${daysUntilEvent()} ${daysUntilEvent() < 2 ? 'Tag' : 'Tagen'}',
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SingleSubjectView(
                    subject: subject!,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
