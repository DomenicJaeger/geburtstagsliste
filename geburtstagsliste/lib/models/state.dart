import 'package:geburtstagsliste/models/event.dart';
import 'package:geburtstagsliste/models/subject.dart';

class ReminderAppState {
  // The list of subjects for whom reminders are set.
  final List<Subject> subjects;
  // The list of events for which reminders are set
  final List<Event> events;

  ReminderAppState({
    required this.subjects,
    required this.events,
  });

  // Creates a copy of the state with the given updates.
  ReminderAppState copyWith({
    List<Subject>? subjects,
    List<Event>? events,
  }) {
    return ReminderAppState(
      subjects: subjects ?? this.subjects,
      events: events ?? this.events,
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
      subjects: json['subjects'].map((subject) => Subject.fromJson(subject)).toList(),
      events: json['events'].map((event) => Event.fromJson(event)).toList(),
    );
  }
}
