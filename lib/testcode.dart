import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row and Column Example'), centerTitle: true,
        ),
        
      
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
