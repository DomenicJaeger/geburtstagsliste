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
    // Initialize the state with empty lists of subjects and events, and set initialized to false
    return ReminderAppState(
      subjects: [],
      events: [],
      initialized: false,
    );
  }

  //Deletes the given event from the state.
  void deleteEvent(Event eventToBeDeleted) {
    state = state.copyWith(events: state.events.where((e) => e != eventToBeDeleted).toList());
  }

  void deleteSubject(Subject subjectToBeDeleted) {
    state = state.copyWith(subjects: state.subjects.where((e) => e != subjectToBeDeleted).toList());

    final newEvents = state.events.where((event) => event.subjectId != subjectToBeDeleted.id).toList();
    state = state.copyWith(events: newEvents);
  }

  void addEvent(Event event) {
    log('${state.events}');
    // Add the event to the list of subjects in the state
    state = state.copyWith(events: [...state.events, event]);
    log('${state.events}');
  }

  void addSubject(Subject subject) {
    // Adds the subject to the list of subjects in the state
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
    // Gets the directory to store the app's data
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    // Creates a file to store the state
    final file = File('${appDocumentsDir.path}/state.json');
    // Converts the state to a JSON string
    final jsonString = jsonEncode(state);
    // Writes the JSON string to the file
    file.writeAsString(jsonString);
  }

  Future<void> load() async {
    // Gets the directory to store the app's data
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    // Creates a file to store the state
    final file = File('${appDocumentsDir.path}/state.json');
    // Check of the file exists
    if (await file.exists()) {
      // Reads the JSON string from the file
      final jsonString = await file.readAsString();
      if (jsonString.isEmpty) {
        state = ReminderAppState.standart();
        return;
      }
      // Decodes the JSON string into a Map
      final loadedState = jsonDecode(jsonString) as Map<String, dynamic>;
      // Updates the state with the loaded data
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
      // If the file does not exist, create an empty state
      state = ReminderAppState(
        subjects: [],
        events: [],
        initialized: true,
      );
    }
  }

  void editSubject(Subject updatedSubject) {
    state = state.copyWith(
      subjects: state.subjects.map((s) => s.id == updatedSubject.id ? updatedSubject : s).toList(),
    );
  }

  void editEvent(Event updatedEvent) {
    state = state.copyWith(
      events: state.events.map((s) => s.eventId == updatedEvent.eventId ? updatedEvent : s).toList(),
    );
  }

  void saveChangedEvent() {}

  void saveChangedSubject() {}
}
