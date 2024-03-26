import 'package:flutter/material.dart';
import 'package:todos/main.dart';
import 'package:todos/pallets/app_colors.dart';
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
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20, top: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.navigate_before,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          '12',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
                        const Text(
                          '24',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
                child: const Text(
                  'Borhanedine Boussaha',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
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
