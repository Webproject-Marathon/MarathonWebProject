import 'package:flutter/material.dart';
import 'package:marathon/pages/check_data_screen.dart';
import 'pages/main_system_screen.dart';

void main() => runApp(MaterialApp(
  home: const MainSystemScreen(),
  initialRoute: '/home',
  routes: {
    '/home':(context) => const MainSystemScreen(),
    '/check':(context) => const CheckDataScreen()
  },
));
