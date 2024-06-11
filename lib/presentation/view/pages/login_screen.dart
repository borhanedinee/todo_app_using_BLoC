import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/bloc/authbloc/auth_bloc.dart';
import 'package:todos/bloc/homebloc/home_bloc.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/pallets/app_colors.dart';
import 'package:todos/presentation/view/components/custom_signin_button.dart';
import 'package:todos/presentation/view/components/custom_text_field.dart';
import 'package:todos/presentation/view/root.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> authKey;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
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
    final homeBloc = BlocProvider.of<HomeBloc>(context);
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
            ),
          ),
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
                      CustomTextField(
                          passwordController: emailController,
                          validator: (value) {
                            if (value == '') {
                              return 'Please enter a valid email address';
                            }
                            if (!value!.contains('@') || !value.contains('.')) {
                              return 'invalid email';
                            }
                            return null;
                          },
                          suffixIcon: null,
                          hint: 'email@example.com',
                          prefixIcon: Icons.mail),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Password'),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        passwordController: passwordController,
                        hint: '* * * * * * * * * * * * *',
                        prefixIcon: Icons.key,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility),
                        ),
                        validator: (value) {
                          if (value == '') {
                            return 'Please enter a password';
                          }
                          return null;
                        },
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
                      style: TextStyle(color: Colors.white),
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
          CustomSignInButton(
            onPressed: () {},
            asset: 'assets/images/google.png',
            child: 'Sign in with google',
          ),
          const SizedBox(
            height: 10,
          ),

          CustomSignInButton(
              onPressed: () {},
              child: 'Sign up with Facebook',
              asset: 'assets/images/facebook.png'),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 70,
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
                    // successfull request but USER NOT FOUND
                    if (state.user == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.grey,

                        ),
                      );
                    } else {
                      prefs.setInt('userid', state.user!.userId!);
                      prefs.setString('username', state.user!.userUsername!);
                      prefs.setString('email', state.user!.userEmail!);
                      prefs.setString('password', state.user!.userPassword!);

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
                      homeBloc.add(
                        FetchHomeDataEvent(userId: prefs.getInt('userid')!),
                      );
                    }
                  }
                  if (state is AuthError) {
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
                      strokeCap: StrokeCap.square,
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
