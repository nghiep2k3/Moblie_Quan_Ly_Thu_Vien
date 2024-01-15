import '../widgets/addbook.dart';
import '../widgets/managementpage.dart';
import '/widgets/homepage.dart';
import '/widgets/settings.dart';
import '/models/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserInterface(),
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => MyHomePage(),
          "/settings": (context) => MySettings(),
          "/quanly" : (context) => ManagementPage(),

        }
      ),
    );
  }
}
