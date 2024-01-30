import 'package:flutter/material.dart';
import 'package:marathon/classes/count_down_timer.dart';
import 'package:marathon/classes/constants.dart';


class BottomNavigationBarWithTimer extends StatelessWidget {
  const BottomNavigationBarWithTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 50.0,
      color: const Color.fromARGB(255, 87, 87, 87),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CountDownTimer(
            targetDateTime: Constants.marathonStartDateTime,
            countDownTimerStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }
}