import 'package:flutter/material.dart';

import '../widgets/bottomNavigation.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: Colors.blueGrey.shade300,
        ),
        body: Container(
          color: Colors.grey[300],
          child: ListView(
            children: [
              SizedBox(
                height: 30,
                child: Container(
                  color: Colors.amber,
                  child: const Text('Options Subtheme #1'),
                ),
              ),
              const Column(
                children: [
                  Text('Option 1'),
                  Text('Option 2'),
                  Text('Option 3'),
                  Text('Option 4'),
                  Text('Option 5'),
                  Text('Option 6'),
                  Text('Option 7'),
                  Text('Option 8'),
                  Text('Option 9'),
                  Text('Option 10'),
                  Text('Option 11'),
                  Text('Option 12'),
                  Text('Option 13'),
                  Text('Option 14'),
                  Text('Option 15'),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      );
}
