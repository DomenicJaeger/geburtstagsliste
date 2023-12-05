// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:geburtstagsliste/models/event.dart';

void main() {
  test('werte von event testen', () {
    final hochzeitstag = Event(title: 'Hochzeitstag', date: DateTime(2011, 10, 14), subjectId: '1A');

    expect(hochzeitstag.title, 'Hochzeitstag');
    expect(
      hochzeitstag.date,
      DateTime(2011, 10, 14),
    );
    expect(hochzeitstag.subjectId, '1A');

    print(
        'Am ${hochzeitstag.date.day}.${hochzeitstag.date.month}.${hochzeitstag.date.year} hatten wir ${hochzeitstag.title}, das war ${hochzeitstag.subjectId}!');
  });

  test('copyWith() testen', () {
    final wichtigerTag = Event(title: 'wichtiger Tag', date: DateTime(1993, 5, 29), subjectId: 'Nummero Uno');
    final tagDanach = wichtigerTag.copyWith(date: wichtigerTag.date.add(const Duration(days: 1)));

    expect(tagDanach.date, DateTime(1993, 5, 30));

    print('Gestern war der ${tagDanach.date.day}.${tagDanach.date.month}. das war ein ${wichtigerTag.title}.');
  });

  test('ne runde rechnen', () {
    final geburtstag = Event(date: DateTime(1970), subjectId: '1', title: 'Geburtstag');
    final now = DateTime.now();

    final difference = now.difference(geburtstag.date);

    print(difference.inDays / 365);
  });
}
