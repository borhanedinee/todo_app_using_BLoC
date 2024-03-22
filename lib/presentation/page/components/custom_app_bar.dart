
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String user;
  CustomAppBar({
    super.key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/boy.png'),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, $user',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text('Your daily adventure starts now')
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.widgets_outlined,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}

