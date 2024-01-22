import 'package:untitled4/testcode.dart';
import 'package:untitled4/widgets/components/news_list.dart';
import 'package:untitled4/widgets/Management/news_management.dart';
import 'package:untitled4/widgets/Action/return_book.dart';
import 'widgets/Action/addbook.dart';
import 'widgets/Management/managementpage.dart';
import '/widgets/homepage.dart';
import '/widgets/settings.dart';
import '/models/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/Action/muonsach.dart';
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
            "/quanly": (context) => ManagementPage(),
            "/quanly_tintuc": (context) => NewsManagement(),
            "/thongtin": (context) => Info(),
            "/muonsach": (context) => Muonsach(),
            "/trasach": (context) => ReturnBook(),
            "/testcode": (context) => MyApp2(),
          }),
    );
  }
}
