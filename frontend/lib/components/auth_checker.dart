import 'package:flutter/material.dart';

class AuthCheckerWidget extends StatelessWidget {
  final Future<bool> isAllowed;
  final Widget child;

  const AuthCheckerWidget({
    Key? key,
    required this.isAllowed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isAllowed,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError || !snapshot.data!) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, '/login');
          });
          return Container(); // Placeholder, won't be shown
        } else {
          return child;
        }
      },
    );
  }
}
