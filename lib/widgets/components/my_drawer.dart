import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Trang chủ"),
            onTap: () => Navigator.of(context).popAndPushNamed("/"),
          ),
          ListTile(
            title: Text("Settings"),
            onTap: () => Navigator.of(context).popAndPushNamed("/settings"),
          ),
          ListTile(
            title: Text("Quản lý"),
            onTap: () => Navigator.of(context).popAndPushNamed("/quanly"),
          ),
        ],
      ),
    );
  }
}
