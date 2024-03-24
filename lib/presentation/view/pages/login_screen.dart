import 'package:flutter/material.dart';
import 'package:todos/main.dart';
import 'package:todos/pallets/app_colors.dart';
import 'package:todos/presentation/view/root.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create an account 🖐',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please register on our SteamLine, where you can continue using our services.',
                    style: TextStyle(color: Colors.grey.shade300),
                  )
                ],
              )),
          const SizedBox(
            height: 40,
          ),
          // Signup with google
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Email'),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter e-mail',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Password'),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Passorwd?',
                      style: TextStyle(color: Color.fromARGB(255, 250, 157, 140)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 1,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
                const Text(
                  'or',
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  width: 150,
                  height: 1,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            child: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 10)),
                  backgroundColor: MaterialStatePropertyAll(
                      AppColors.signUpWithGoogleButtonColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign up with Google',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/google.png',
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            child: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 10)),
                backgroundColor: MaterialStatePropertyAll(
                    AppColors.signUpWithGoogleButtonColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign up with Facebook',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/facebook.png',
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => RootScreen(),
                ));
              },
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
              ),
              child: const Text(
                'Login',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}