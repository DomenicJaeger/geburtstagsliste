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

  ReminderAppState.standart()
      : subjects = [
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
        events = [
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
          Event(title: 'Betriebsjubiläum', date: DateTime(1999, 3, 25), subjectId: '006'),
        ],
        initialized = true;

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
