// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:geburtstagsliste/models/event.dart';
import 'package:geburtstagsliste/models/subject.dart';

void main() {
  test('teste event', () {
    final event1 = Event(title: 'Hochzeitstag', date: DateTime(2012, 10, 12), subjectId: '008');

    expect(event1.title, 'Hochzeitstag');
    expect(event1.date, DateTime(2012, 10, 12));
    expect(event1.subjectId, '008');

    print('Das Event ${event1.subjectId} ist ein ${event1.title} und ist datiert auf den ${event1.date.day}.${event1.date.month}.');
  });
  test('teste subject', () {
    final subject1 = Subject(id: '004', name: 'Gottfried Neumann');

    expect(subject1.name, 'Gottfried Neumann');
    expect(subject1.id, '004');

    print('${subject1.name} gehört zur ID ${subject1.id}');
  });

  test('teste beides', () {
    final event2 = Event(title: 'Silberhochzeit', date: DateTime(1999, 4, 28), subjectId: '0a');
    final subject2 = Subject(id: '0a', name: 'Regina und Markus');

    print('da ${subject2.name} am ${event2.date.day}.${event2.date.month}.${event2.date.year} geheiratet haben steht bald ihre ${event2.title} bevor');
  });

  test('teste tojson', () {
    final guderTyp = Subject(id: '1A', name: 'Toller Tom');
    final json = guderTyp.toJson();
    print(json);
  });
}
