// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:geburtstagsliste/models/subject.dart';

void main() {
  test('werte von subject testen', () {
    final guderTyp = Subject(id: 'super', name: 'toller Thomas');

    expect(guderTyp.id, 'super');
    expect(guderTyp.name, 'toller Thomas');

    print('Na ${guderTyp.id} du bist ja ein ${guderTyp.name}');
  });

  test('subject toJson', () {
    final subject1 = Subject(id: '001', name: 'Max Mustermann');
    final json = subject1.toJson();
    final subject2 = Subject.fromJson(json);
    expect(subject1.id, subject2.id);
    expect(subject1.name, subject2.name);
    expect(subject1 == subject2, true);
    print(json);
  });

  test('copyWith() testen', () {
    final juergenLedig = Subject(id: 'Kollege Nr 1', name: 'Juergen Meier');

    final juergenVerheiratet = juergenLedig.copyWith(name: 'Juergen Meier-Schmitt');

    expect(juergenVerheiratet.id, 'Kollege Nr 1');
    expect(juergenVerheiratet.name, 'Juergen Meier-Schmitt');

    print(' Unser ${juergenVerheiratet.id} ist jetzt verheiratet und heißt jetzt ${juergenVerheiratet.name}');
  });
}
