import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/bloc/authbloc/auth_bloc.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/pallets/app_colors.dart';
import 'package:todos/presentation/view/root.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var authKey;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    authKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: ListView(
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
            key: authKey,
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
                        validator: (value) {
                          if (value == '') {
                            return 'Please enter a valid email address';
                          }
                          if (!value!.contains('@') || !value.contains('.')) {
                            return 'invalid email';
                          }
                          return null;
                        },
                        controller: emailController,
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
                        validator: (value) {
                          if (value == '') {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        controller: passwordController,
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
                      style:
                          TextStyle(color: Color.fromARGB(255, 250, 157, 140)),
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
                if (authKey.currentState!.validate()) {
                  authBloc.add(
                    LoginEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                }
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
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    if (state.user == null) {
                      print('borhan');
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.grey,
                      ),
                    );
                    } else {
                      print('maria');
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.grey,
                        
                      ),
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => RootScreen(),
                      ),
                    );
                    }
                  }
                  if (state is AuthError) 
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.grey,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  } else {
                    return const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  }
                },
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
