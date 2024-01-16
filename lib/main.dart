import 'package:untitled4/testcode.dart';
import './widgets/addbook.dart';
import '../widgets/managementpage.dart';
import '/widgets/homepage.dart';
import '/widgets/settings.dart';
import '/models/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/muonsach.dart';
import './widgets/info.dart';

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
          "/quanly" : (context) => ManagementPage(),
          "/thongtin" : (context) => Info(),
          "/muonsach" : (context) =>  Muonsach(),
          "/testcode" : (context) =>  MyApp2(),

        }
      ),
    );
  }
}


