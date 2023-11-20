import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/models/event.dart';
import 'package:geburtstagsliste/models/reminder_app_state.dart';
import 'package:geburtstagsliste/models/subject.dart';
import 'package:path_provider/path_provider.dart';

//This class provides the state for the reminder app
class ReminderAppStateProvider extends Notifier<ReminderAppState> {
  // List of subjects and list of events for whom reminders are set
  @override
  ReminderAppState build() {
    return ReminderAppState(
      subjects: [],
      events: [],
      initialized: false,
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

    final newEvents = state.events.where((event) => event.subjectId != subjectToBeDeleted.id).toList();
    state = state.copyWith(events: newEvents);
  }

  void addEvent(Event event) {
    log('${state.events}');
    state = state.copyWith(events: [...state.events, event]);
    log('${state.events}');
  }

  void addSubject(Subject subject) {
    state = state.copyWith(subjects: [...state.subjects, subject]);
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

  void save() async {
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    print(appDocumentsDir.path);
    final file = File('${appDocumentsDir.path}/state.json');
    final jsonString = jsonEncode(state);
    file.writeAsString(jsonString);
  }

  Future<void> load() async {
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    final file = File('${appDocumentsDir.path}/state.json');

    if (await file.exists()) {
      final jsonString = await file.readAsString();
      final loadedState = jsonDecode(jsonString) as Map<String, dynamic>;
      state = state.copyWith(
        subjects: List<Subject>.from(loadedState['subjects'].map((s) => Subject.fromJson(s))),
        events: List<Event>.from(
          loadedState['events'].map(
            (e) => Event.fromJson(e),
          ),
        ),
        initialized: true,
      );
    } else {
      state = ReminderAppState(
        subjects: [],
        events: [],
        initialized: true,
      );
    }
  }
}
