// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/main.dart';
import 'package:geburtstagsliste/presentation/widgets/bottomNavigation.dart';
import 'package:geburtstagsliste/presentation/widgets/event_card.dart';

// The main home page for the reminder app.
class HomeView extends ConsumerWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current state of the reminder app from the widget tree.
    final state = ref.watch(refReminderAppStateProvider);
    // Sort the events in the state by the number of days until the event
    state.events.sort((a, b) => daysUntilEvent(a) - daysUntilEvent(b));

    //Build a Scaffold widget with an AppBar, a Column and a BottomNavigationBar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birthday Reminder'),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // Create a list of EventCard widgets for eacht event in the state
          children: [
            for (final event in state.events) EventCard(event: event),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
