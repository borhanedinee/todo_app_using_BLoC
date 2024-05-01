import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos/bloc/authbloc/auth_bloc.dart';
import 'package:todos/bloc/homebloc/home_bloc.dart';
import 'package:todos/data/repositpry/home_repo.dart';
import 'package:todos/data/repositpry/user_repo.dart';
import 'package:todos/presentation/pallets/app_colors.dart';
import 'package:todos/presentation/view/pages/get_started.dart';

late SharedPreferences prefs; 

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

late Size size;
Logger logger = Logger();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => HomeBloc(
              taskRepository: RepositoryProvider.of<HomeRepository>(context),
            ),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 20),
                ),
                backgroundColor:
                    const MaterialStatePropertyAll(AppColors.primaryColor),
                elevation: const MaterialStatePropertyAll(5),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )),
              primaryColor: AppColors.primaryColor,
              fontFamily: 'Bai Jamjuree',
              colorScheme: const ColorScheme.dark(
                  primary: AppColors.primaryColor, background: Colors.black)),
          debugShowCheckedModeBanner: false,
          home: const GetStarted(),
        ),
      ),
    );
  }
}
