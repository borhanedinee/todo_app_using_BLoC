import 'package:flutter/material.dart';
import 'package:todos/presentation/page/get_started.dart';

void main() {
  runApp(const MyApp());
}

late Size size ;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Bai Jamjuree',
        colorScheme: ColorScheme.dark(
          background: Colors.black
          
        )
        
      ),
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
    );
  }
}