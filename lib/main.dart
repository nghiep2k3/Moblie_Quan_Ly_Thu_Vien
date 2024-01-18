import 'package:untitled4/testcode.dart';
import 'package:untitled4/widgets/return_book.dart';
import './widgets/addbook.dart';
import '../widgets/managementpage.dart';
import '/widgets/homepage.dart';
import '/widgets/settings.dart';
import '/models/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/muonsach.dart';
import './widgets/info.dart';
import '../widgets/theme_provider.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserInterface(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => MyHomePage(),
            "/settings": (context) => MySettings(),
            "/quanly": (context) => ManagementPage(),
            "/thongtin": (context) => Info(),
            "/muonsach": (context) => Muonsach(),
            "/trasach": (context) => ReturnBook(),
            "/testcode": (context) => MyApp2(),
          }),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: Consumer<ThemeProvider>(
//         builder: (context, themeProvider, child) {
//           return MaterialApp(
//             title: 'Dark Mode Example',
//             theme: ThemeData.light(),
//             darkTheme: ThemeData.dark(),
//             themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
//             home: MyHomePage(),
//           );
//         },
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dark Mode Example'),
//       ),
//       body: Center(
//         child: Text('Hello World!'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
//         },
//         child: Icon(Icons.lightbulb),
//       ),
//     );
//   }
// }
