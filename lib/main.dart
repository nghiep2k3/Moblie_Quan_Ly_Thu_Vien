import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý thư viện'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[300],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('Main Content'),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: SizedBox(
              height: 100.0, // Chỉnh chiều cao tại đây
              child: Center(
                child: Text(
                  'User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Quản lý'),
            onTap: () {
              // Thực hiện hành động khi nhấn vào "Quản lý"
              Navigator.pop(context); // Đóng Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Mượn sách'),
            onTap: () {
              // Thực hiện hành động khi nhấn vào "Mượn sách"
              Navigator.pop(context); // Đóng Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Trả sách'),
            onTap: () {
              // Thực hiện hành động khi nhấn vào "Trả sách"
              Navigator.pop(context); // Đóng Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Cài đặt'),
            onTap: () {
              // Thực hiện hành động khi nhấn vào "Cài đặt"
              Navigator.pop(context); // Đóng Drawer
            },
          ),
        ],
      ),
    );
  }
}
