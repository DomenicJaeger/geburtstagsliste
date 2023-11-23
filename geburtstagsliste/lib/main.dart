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
final refReminderAppStateProvider = NotifierProvider<ReminderAppStateProvider, ReminderAppState>(
  () {
    // Initialize the ReminderAppStateProvider instace
    final reminderAppStateProvider = ReminderAppStateProvider();
    // Load the initial state of the reminders
    reminderAppStateProvider.load();
    // Return the initialized ReminderAppStateProvider
    return reminderAppStateProvider;
  },
);

// The main app widget.
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for changes to the ReminderAppStateProvider
    ref.listen(refReminderAppStateProvider, (previous, next) {
      // Check of the previous state was initialized
      if (previous != null) {
        if (previous.initialized) {
          // Save the current state of the reminders
          final provider = ref.read(refReminderAppStateProvider.notifier);
          provider.save();
        }
      }
    });
    return MaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 177, 209, 252))),
    );
  }
}
