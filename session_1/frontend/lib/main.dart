import 'package:flutter/material.dart';
import 'package:marathon/pages/admin_menu.dart';
import 'package:marathon/pages/check_data_screen.dart';
import 'package:marathon/pages/confirm_reg_screen.dart';
import 'package:marathon/pages/coordinator_menu.dart';
import 'package:marathon/pages/detailed_info_screen.dart';
import 'package:marathon/pages/runner_menu.dart';
import 'pages/main_system_screen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/admin_menu',
  routes: {
    '/home':(context) => const MainSystemScreen(),
    '/check':(context) => const CheckDataScreen(),
    '/info':(context) => const DetailedInfoScreen(),
    '/reg_cofirm':(context) => const ConfirmRegScreen(),
    '/runner_menu':(context) => const RunnerMenuScreen(),
    '/coordinator_menu':(context) => const CoordinatorMenuScreen(),
    '/admin_menu':(context) => const AdminMenuScreen()
  },
));
