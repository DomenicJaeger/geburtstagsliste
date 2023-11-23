import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:geburtstagsliste/models/subject.dart';
import 'package:geburtstagsliste/presentation/pages/single_subject_view.dart';

// A widget that dispplay a single event.
class SubjectCard extends ConsumerWidget {
  //The event to be displayed
  const SubjectCard({
    super.key,
    required this.subject,
  });

  final Subject subject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the 'refReminderAppStateProvider' provider form the widget tree.
    final stateProvider = ref.read(refReminderAppStateProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            // A widget that displays a container that can be tapped.
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.brown.shade100,
                  width: 1.0,
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.brown.shade100,
                              width: 1.0,
                            ),
                            color: Colors.lightBlue),
                        child: const Text('BILD'),
                      ),
                    ),
                    Text(subject.name),
                    SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: Colors.grey.shade200),
                        child: IconButton(
                          onPressed: () {
                            stateProvider.deleteSubject(subject);
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.grey.shade700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SingleSubjectView(
                          subject: subject,
                        )),
              );
            },
          ),
        ),
      ],
    );
  }
}
