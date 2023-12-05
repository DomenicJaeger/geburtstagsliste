// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geburtstagsliste/presentation/pages/settings_view.dart';
import 'package:geburtstagsliste/presentation/pages/subjects_view.dart';

import '../pages/home_view.dart';

//Define a StateProvider for managing the navigation state
final navigationStateProvider = StateProvider((ref) => NavigationState(selectedIndex: 0));

//Create a ConsumerWidget class for the BottomNavigationBarWidget
class BottomNavigationBarWidget extends ConsumerWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  //Build the BottomNavigationBarWidget widget
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Read the current navigation state from the StateProvider
    final navigationState = ref.watch(navigationStateProvider);

    //Return the BottomNavigationBar widget
    return BottomNavigationBar(
      backgroundColor: Colors.blueGrey.shade300,
      //Set the selected item color to white
      selectedItemColor: Colors.white,
      //Set the unselected item color to white
      unselectedItemColor: Colors.black,
      //Set the current index based on the navigation state
      currentIndex: navigationState.selectedIndex,

      //Handle onTap events
      onTap: (final index) {
        //Update the navigation state with the selected index
        final navigationState = ref.read(navigationStateProvider)..selectedIndex = index;

        //Navigate to the corresponding screen based on the selected index
        switch (index) {
          case 0:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeView()));
            break;
          case 1:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SubjectsView()));
            break;
          case 2:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SettingsView()));
            break;
        }
      },

      //Define the BottomNavigationBar items
      items: [
        BottomNavigationBarItem(
          //Set the background color of the Home item
          backgroundColor: Colors.blueGrey.shade300,
          //Display the Home icon
          icon: const Icon(Icons.home),
          //Set the label text for the Home item
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.blueGrey.shade300,
          icon: const Icon(Icons.person),
          label: 'Subjects',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.blueGrey.shade300,
          icon: const Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}

//Define the NavigationState class to hold the selected index
class NavigationState {
  NavigationState({required this.selectedIndex});

  //The currently selected index
  int selectedIndex;
}
