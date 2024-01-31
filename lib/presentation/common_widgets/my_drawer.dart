import 'package:flutter/material.dart';
import 'package:notification_app/presentation/screens/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // App Logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.notifications,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          // Home Tile
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: const Text(
                'H O M E',
              ),
              leading: const Icon(Icons.home),
              onTap: () => Navigator.pop(context),
            ),
          ),
          // Settings Tile
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: const Text(
                'S E T T I N G S',
              ),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
