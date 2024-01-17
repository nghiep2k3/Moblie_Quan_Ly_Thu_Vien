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
            leading: const Icon(Icons.home),
            onTap: () => Navigator.of(context).popAndPushNamed("/"),
          ),
          ListTile(
            leading: const Icon(Icons.manage_accounts),
            title: const Text("Quản lý"),
            onTap: () => Navigator.of(context).popAndPushNamed("/quanly"),
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text("Mượn sách"),
            onTap: () => Navigator.of(context).popAndPushNamed("/muonsach"),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Trả sách"),
            onTap: () => Navigator.of(context).popAndPushNamed("/trasach"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Thông tin người mượn"),
            onTap: () => Navigator.of(context).popAndPushNamed("/thongtin"),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Cài đặt"),
            onTap: () => Navigator.of(context).popAndPushNamed("/settings"),
          ),
          ListTile(
            leading: const Icon(Icons.developer_board),
            title: const Text("Test"),
            onTap: () => Navigator.of(context).popAndPushNamed("/testcode"),
          ),
        ],
      ),
    );
  }
}
