import 'package:flutter_test/flutter_test.dart';
import 'package:geburtstagsliste/models/event.dart';
import 'package:geburtstagsliste/models/state.dart';
import 'package:geburtstagsliste/models/subject.dart';

void main() {
  test('tojson fromjson', () {
    final appState1 = ReminderAppState(
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
        Event(title: 'Betriebsjubiläum', date: DateTime(1999, 3, 25), subjectId: '006'),
      ],
    );
    final json1 = appState1.toJson();

    final appState2 = ReminderAppState.fromJson(json1);

    final json2 = appState2.toJson();
    print(json1);
    print(json2);
    expect(json1.toString(), json2.toString());
  });
}
