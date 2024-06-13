
import 'package:flutter/material.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/pallets/app_colors.dart';

class CustomSignInButton extends StatelessWidget {
  final void Function()? onPressed;

  final Widget child;

  final String asset;

  const CustomSignInButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
            padding:
                MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10 , vertical: 5)),
            backgroundColor: MaterialStatePropertyAll(
                AppColors.signUpWithGoogleButtonColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              asset,
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
