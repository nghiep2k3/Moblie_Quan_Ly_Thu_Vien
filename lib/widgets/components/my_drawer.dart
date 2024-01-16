import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Trang chủ"),
            onTap: () => Navigator.of(context).popAndPushNamed("/"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Quản lý"),
            onTap: () => Navigator.of(context).popAndPushNamed("/quanly"),
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text("Mượn sách"),
            onTap: () => Navigator.of(context).popAndPushNamed("/muonsach"),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () => Navigator.of(context).popAndPushNamed("/settings"),
          ),
        ],
      ),
    );
  }
}
