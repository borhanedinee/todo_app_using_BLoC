import 'package:flutter/material.dart';
import 'package:todos/pallets/app_colors.dart';
import 'package:todos/presentation/view/pages/add_note_screen.dart';
import 'package:todos/presentation/view/pages/agenda_screen.dart';
import 'package:todos/presentation/view/pages/home_screen.dart';
import 'package:todos/presentation/view/pages/profile_screen.dart';
import 'package:todos/presentation/view/pages/stats_screen.dart';

class RootScreen extends StatefulWidget {
  RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  List body = [const HomeScreen(), AgendaScreen(), const StatsScreen(), const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: customNavigationBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNoteScreen(),));
        },
        child: const Icon(Icons.add , color: Colors.white, size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Container customNavigationBar() {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home_outlined , color: AppColors.primaryColor.withOpacity(currentIndex == 0? 1 : 0.4),size: 30,),
            onPressed: () {
              setState(() {
                currentIndex = 0;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, color: AppColors.primaryColor.withOpacity(currentIndex == 1? 1 : 0.4),),
            onPressed: () {
              setState(() {
                currentIndex = 1;
              });
            },
          ),
          const SizedBox(width: 48), // Custom space between items
          IconButton(
            icon: Icon(Icons.stairs_outlined, color: AppColors.primaryColor.withOpacity(currentIndex == 2? 1 : 0.4),size: 28,),
            onPressed: () {
              setState(() {
                currentIndex = 2;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.person_outline_outlined, color: AppColors.primaryColor.withOpacity(currentIndex == 3? 1 : 0.4),size: 30,),
            onPressed: () {
              setState(() {
                currentIndex = 3;
              });
            },
          ),
        ],
      ),
    );
  }
}
