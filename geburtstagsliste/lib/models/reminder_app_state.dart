import 'package:geburtstagsliste/models/event.dart';
import 'package:geburtstagsliste/models/subject.dart';

class ReminderAppState {
  // The list of subjects for whom reminders are set.
  final List<Subject> subjects;
  // The list of events for which reminders are set
  final List<Event> events;
  final bool initialized;

  ReminderAppState({
    required this.subjects,
    required this.events,
    required this.initialized,
  });

  // Creates a copy of the state with the given updates.
  ReminderAppState copyWith({
    List<Subject>? subjects,
    List<Event>? events,
    bool? initialized,
  }) {
    return ReminderAppState(
      subjects: subjects ?? this.subjects,
      events: events ?? this.events,
      initialized: initialized ?? this.initialized,
    );
  }

  // Converts the state to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'subjects': subjects.map((subject) => subject.toJson()).toList(),
      'events': events.map((event) => event.toJson()).toList(),
    };
  }

  // Creates a new state from a JSON object.
  factory ReminderAppState.fromJson(Map<String, dynamic> json) {
    return ReminderAppState(
      subjects: json['subjects'].map<Subject>((subject) {
        print(subject);
        return Subject.fromJson(subject);
      }).toList(),
      events: json['events'].map<Event>((event) => Event.fromJson(event)).toList(),
      initialized: false,
    );
  }
}
