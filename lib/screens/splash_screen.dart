import 'dart:math';

import 'package:day17_30doc/utilities/styles_and_constants.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kBackgroundColor,
      body: Center(
        child: AnimatedLogo(),
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> splashScreenRotateAnimation;
  Animation<double> splashScreenTranslateAnimation;
  bool rotated = false;

  void _runAnimation() {
    animationController = AnimationController(
        vsync: this, duration: kSplashScreenAnimationDuration);
    splashScreenRotateAnimation =
        Tween<double>(begin: 0, end: 2).animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    splashScreenTranslateAnimation =
        Tween<double>(begin: -260, end: 0).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    animationController.forward();

    animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          rotated = true;
          animationController.reverse();
        }
        if (status == AnimationStatus.dismissed){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()));
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _runAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotated ? 0 : splashScreenRotateAnimation.value * pi,
      child: Transform.translate(
        offset: Offset(0, rotated ? splashScreenTranslateAnimation.value : 0),
        child: kBookLogo(Logosize.large),
      ),
    );
  }
}
