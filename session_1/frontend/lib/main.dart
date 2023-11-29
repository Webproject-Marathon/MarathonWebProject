import 'package:flutter/material.dart';
import 'package:marathon/pages/check_data_screen.dart';
import 'package:marathon/pages/detailed_info_screen.dart';
import 'pages/main_system_screen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/info',
  routes: {
    '/home':(context) => const MainSystemScreen(),
    '/check':(context) => const CheckDataScreen(),
    '/info':(context) => const DetailedInfoScreen()
  },
));
