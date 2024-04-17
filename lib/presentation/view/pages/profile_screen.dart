import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/bloc/homebloc/home_bloc.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/pallets/app_colors.dart';
import 'package:todos/presentation/view/components/custom_appbar.dart';
import 'package:todos/presentation/view/components/profile_components/settings_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DefaultAppBar(title: 'Profile'),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state is HomeLoading) {
                              return const Text(
                                'loading...',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              );
                            }
                            if (state is HomeLoaded) {
                              return Text(
                                state.inProgressCount.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              );
                            }
                            if (state is HomeError) {
                              return const Text(
                                '?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              );
                            }
                            return Container();
                          },
                        ),
                        Text('In progress tasks',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade200)),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/boy.png'),
                    ),
                    Column(
                      children: [
                        BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state is HomeLoading) {
                              return const Text(
                                'loading...',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              );
                            }
                            if (state is HomeLoaded) {
                              return Text(
                                state.completedCount.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              );
                            }
                            if (state is HomeError) {
                              return const Text(
                                '?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              );
                            }
                            return Container();
                          },
                        ),
                        Text('Completed tasks',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade200)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                width: size.width,
                child: Text(
                  prefs.getString('username')!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 24),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 40),
                width: size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(AppColors.primaryColor),
                    elevation: const MaterialStatePropertyAll(5),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const ProfileSettingsItem(
                icon: Icons.notifications,
                itemLabel: 'Notifications',
              ),
              const ProfileSettingsItem(
                icon: Icons.settings,
                itemLabel: 'App appearance',
              ),
              const ProfileSettingsItem(
                icon: Icons.language,
                itemLabel: 'Langauage',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
