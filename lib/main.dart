import 'package:flutter/material.dart';
import 'package:todos/presentation/pallets/app_colors.dart';
import 'package:todos/presentation/view/pages/get_started.dart';

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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle( padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 20),
                ),
                backgroundColor:
                    const MaterialStatePropertyAll(AppColors.primaryColor),
                elevation: const MaterialStatePropertyAll(5),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),)
        ),
        primaryColor: AppColors.primaryColor,
        fontFamily: 'Bai Jamjuree',
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryColor,
          background: Colors.black
          
          
        )
        
      ),
      debugShowCheckedModeBanner: false,
      home: const GetStarted(),
    );
  }
}