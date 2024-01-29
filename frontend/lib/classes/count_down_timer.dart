import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key? key,
    required this.targetDateTime,
    this.countDownTimerStyle,
  }) : super(key: key);

  final DateTime targetDateTime;
  final TextStyle? countDownTimerStyle;

  @override
  State createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Duration duration;

  String get timerDisplayString {
    final duration = _controller.duration! * _controller.value;

    var seconds = duration.inSeconds;
    final days = seconds ~/ (3600 * 24);
    seconds %= 3600 * 24;
    final hours = seconds ~/ 3600;
    seconds %= 3600;
    final minutes = seconds ~/ 60;
    seconds %= 60;

    final daysStr = days.toString().padLeft(2, '0');
    final hoursStr = hours.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');

    return 'До начала марафона осталось $daysStr дней, $hoursStr часов, $minutesStr минут и $secondsStr секунд';
  }


  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final difference = widget.targetDateTime.difference(now);
    duration = Duration(seconds: difference.inSeconds);

    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller
      .reverse(from: difference.inSeconds.toDouble());
  }

  @override
  void didUpdateWidget(CountDownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    final now = DateTime.now();
    final difference = widget.targetDateTime.difference(now);

    if (difference != Duration(seconds: _controller.duration!.inSeconds)) {
      setState(() {
        duration = Duration(seconds: difference.inSeconds);
        _controller.dispose();
        _controller = AnimationController(
          vsync: this,
          duration: duration,
        );
        _controller
          .reverse(from: difference.inSeconds.toDouble());
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, Widget? child) {
          return Text(
            timerDisplayString,
            style: widget.countDownTimerStyle,
          );
        },
      ),
    );
  }
}
