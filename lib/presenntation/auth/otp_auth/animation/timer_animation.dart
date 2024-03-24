import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/application/auth/auth_view_model.dart';

class TimerAnimation extends StatefulWidget {
  final Duration? duration;
  final VoidCallback? onTimerComplete;
  final AuthViewModel? authViewModel;

  const TimerAnimation({
    Key? key,
    this.duration,
    this.onTimerComplete,
    this.authViewModel,
  }) : super(key: key);

  @override
  State<TimerAnimation> createState() => _TimerAnimationState();
}

class _TimerAnimationState extends State<TimerAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late bool _timerEnded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _timerEnded = true;
          });
        }
      });
    _controller.forward();
  }

  void restartTimer() {
    setState(() {
      _timerEnded = false;
    });
    _controller.reset();
    _controller.forward();
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
          animation: _animation,
          builder: (context, child) {
            if (_timerEnded) {
              return GestureDetector(
                onTap: () {
                  restartTimer();
                  widget.authViewModel!.resendEmailToken();
                },
                child: Text("Resend Code 30 secs",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF727272))),
              );
            } else {
              return Text(
                // '${(_controller.duration!.inSeconds * (1 - _animation.value)).ceil()}',
                // (_animation.value * 30).toStringAsFixed(0),
                '${((_controller.duration!.inSeconds - _controller.value * _controller.duration!.inSeconds)).round()}',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF727272)),
              );
            }
          }),
    );
  }
}
