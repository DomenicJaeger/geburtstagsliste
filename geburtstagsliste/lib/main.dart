import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/models/reminder_app_state.dart';
import 'package:geburtstagsliste/presentation/pages/home_view.dart';
import 'package:geburtstagsliste/provider/reminder_app_state_provider.dart';

// The main entry point for the app.
void main() async {
  // Wrap the app in a ProviderScope widget so that the ReminderAppStateProvider
  // can be accessed from anywhere in the widget tree
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

// A provider that provides a ReminderAppState object.
// final refReminderAppStateProvider = NotifierProvider<ReminderAppStateProvider, ReminderAppState>(
//   () => ReminderAppStateProvider(),
//   ReminderAppStateProvider.load();
//   return ReminderAppStateProvider;
// );

final refReminderAppStateProvider = NotifierProvider<ReminderAppStateProvider, ReminderAppState>(
  () {
    final reminderAppStateProvider = ReminderAppStateProvider();
    reminderAppStateProvider.load();
    return reminderAppStateProvider;
  },
);

// The main app class.
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Return a MaterialApp widget with the HomeView as its home page.
    ref.listen(refReminderAppStateProvider, (previous, next) {
      if (previous != null) {
        if (previous.initialized) {
          final provider = ref.read(refReminderAppStateProvider.notifier);
          provider.save();
        }
      }
    });
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
