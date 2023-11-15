import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/models/event.dart';
import 'package:geburtstagsliste/models/state.dart';
import 'package:geburtstagsliste/models/subject.dart';

//This class provides the state for the reminder app
class ReminderAppStateProvider extends Notifier<ReminderAppState> {
  // List of subjects and list of events for whom reminders are set
  @override
  ReminderAppState build() {
    return ReminderAppState(
      subjects: [
        Subject(id: '001', name: 'Hans'),
        Subject(id: '002', name: 'Anna'),
        Subject(id: '003', name: 'Peter'),
        Subject(id: '004', name: 'Doerte'),
        Subject(id: '005', name: 'Sven'),
        Subject(id: '006', name: 'Janina'),
        Subject(id: '007', name: 'Jasmin'),
        Subject(id: '008', name: 'Ali'),
        Subject(id: '009', name: 'Mario'),
        Subject(id: '010', name: 'Emil'),
        Subject(id: '011', name: 'Jenny'),
      ],
      events: [
        Event(title: 'Geburtstag', date: DateTime(1989, 11, 2), subjectId: '001'),
        Event(title: 'Geburtstag Katze', date: DateTime(2021, 9, 11), subjectId: '001'),
        Event(title: 'Geburtstag Hund', date: DateTime(2020, 11, 18), subjectId: '002'),
        Event(title: 'Geburtstag', date: DateTime(1988, 11, 8), subjectId: '002'),
        Event(title: 'Geburtstag', date: DateTime(1985, 6, 21), subjectId: '003'),
        Event(title: 'Geburtstag', date: DateTime(1987, 12, 30), subjectId: '004'),
        Event(title: 'Geburtstag', date: DateTime(1982, 7, 4), subjectId: '005'),
        Event(title: 'Geburtstag', date: DateTime(1977, 3, 2), subjectId: '006'),
        Event(title: 'Geburtstag', date: DateTime(1991, 12, 14), subjectId: '007'),
        Event(title: 'Geburtstag', date: DateTime(1996, 8, 9), subjectId: '008'),
        Event(title: 'Geburtstag', date: DateTime(1980, 2, 12), subjectId: '009'),
        Event(title: 'Geburtstag', date: DateTime(1995, 6, 1), subjectId: '010'),
        Event(title: 'Geburtstag', date: DateTime(1993, 5, 29), subjectId: '011'),
        Event(title: 'Erstes gemeinsames Treffen', date: DateTime(2002, 5, 19), subjectId: '006'),
        Event(title: 'Betriebsjubiläum', date: DateTime(1999, 3, 25), subjectId: '006'),
      ],
    );
  }

  //Deletes the given event from the state.
  void deleteEvent(Event eventToBeDeleted) {
    ////Create a new list of events without the event to be deleted.
    // final newEvents = <Event>[];
    // for (final e in state.events) {
    //   if (e != eventToBeDeleted) {
    //     newEvents.add(e);
    //   }
    // }
    ////Update the state with the new list of events
    // state = state.copyWith(events: newEvents);

    //another way to do the above, using the 'where()' method to filter out the event to be deleted
    state = state.copyWith(events: state.events.where((e) => e != eventToBeDeleted).toList());
  }

  void deleteSubject(Subject subjectToBeDeleted) {
    state = state.copyWith(subjects: state.subjects.where((e) => e != subjectToBeDeleted).toList());
  }

  void addEvent(Event event) {
    log('${state.events}');
    state = state.copyWith(events: [...state.events, event]);
    log('${state.events}');
  }

  // Gets the subject with the given ID from the state.
  Subject? getSubjectById(String id) {
    //Iterate over the list of subjects and return the one with the given ID.
    for (final s in state.subjects) {
      if (s.id == id) return s;
    }
    //If no subject with the given ID is found, return 'null'
    return null;
  }
}
