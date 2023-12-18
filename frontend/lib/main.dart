import 'package:flutter/material.dart';
import 'package:marathon/pages/28_volonter.dart';
import 'package:marathon/pages/add_blago27.dart';
import 'package:marathon/pages/add_user.dart';
import 'package:marathon/pages/admin_menu.dart';
import 'package:marathon/pages/blago_26.dart';
import 'package:marathon/pages/certificate.dart';
import 'package:marathon/pages/check_data_screen.dart';
import 'package:marathon/pages/confirm_reg_screen.dart';
import 'package:marathon/pages/confirm_sponsor.dart';
import 'package:marathon/pages/control_runners.dart';
import 'package:marathon/pages/coordinator_menu.dart';
import 'package:marathon/pages/detailed_info_screen.dart';
import 'package:marathon/pages/edit_user.dart';
import 'package:marathon/pages/event_registration_screen.dart';
import 'package:marathon/pages/how_long_screen.dart';
import 'package:marathon/pages/inventory.dart';
import 'package:marathon/pages/inventory_arrival.dart';
import 'package:marathon/pages/load_volunteer.dart';
import 'package:marathon/pages/manage_runner.dart';
import 'package:marathon/pages/marathon_info.dart';
import 'package:marathon/pages/my_results.dart';
import 'package:marathon/pages/my_sponsor.dart';
import 'package:marathon/pages/21_sponsor.dart';
import 'package:marathon/pages/past_races_results.dart';
import 'package:marathon/pages/runner_menu.dart';
import 'package:marathon/pages/runner_sponsor.dart';
import 'package:marathon/pages/runner_registration_screen.dart';
import 'package:marathon/pages/runner_profile_edit.dart';
import 'package:marathon/pages/user_management.dart';
import 'package:marathon/pages/bmr_screen.dart';
import 'package:marathon/pages/bmi_screen.dart';
import 'pages/main_system_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/control_charity',
  routes: {
    '/home':(context) => const MainSystemScreen(),
    '/check':(context) => const CheckDataScreen(),
    '/info':(context) => const DetailedInfoScreen(),
    '/reg_confirm':(context) => const ConfirmRegScreen(),
    '/runner_menu':(context) => const RunnerMenuScreen(),
    '/runner_reg':(context) => const RunnerRegistrationHomeScreen(),
    '/runner_edit':(context) => const RunnerProfileEditHomeScreen(),
    '/coordinator_menu':(context) => const CoordinatorMenuScreen(),
    '/admin_menu':(context) => const AdminMenuScreen(),
    '/manage_runner':(context) => const ManageRunnerHomeScreen(),
    '/marathon_info':(context) => const MarathonInfoScreen(),
    '/event_reg':(context) => const EventRegistrationHomeScreen(),
    '/how_long':(context) => const HowLongScreen(),
    '/sponsor_confirm':(context) => const ConfirmSponsorScreen(),
    '/my_sponsor':(context) => const MySponsorScreen(),
    '/runner_sponsor':(context) => const RunnerSponsorScreen(),
    '/user_management':(context) => const UserManagementHomeScreen(),
    '/bmi':(context) => const BMIHomeScreen(),
    '/bmr':(context) => const BMRHomeScreen(),
    '/past_races':(context) => const PastRacesResult(),
    '/my_results':(context) => const MyResultsScreen(),
    '/control_runners':(context) => const ControlRunners(),
    '/load_volunteer':(context) => const LoadVolunteer(),
    '/inventory_arrival':(context) => const InventoryArrival(),
    '/inventory':(context) => const InventoryScreen(),
    '/certificate':(context) => const CertificateScreen(),
    '/edit_user':(context) => const EditUser(),
    '/add_user':(context) => const AddUser(),
    '/sponsor_view':(context) => const SponsorView(),
    '/manage_volonteer':(context) => const ManageVolonteer(),
    '/control_charity':(context) => const ControlCharity(),
    '/blago': (context) => const Blago()

  },
));
