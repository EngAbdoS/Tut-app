
import 'dart:async';

import 'package:flu_proj/presentation/resourses/assets_manager.dart';
import 'package:flu_proj/presentation/resourses/color_manager.dart';
import 'package:flu_proj/presentation/resourses/constant_manager.dart';
import 'package:flutter/material.dart';

import '../resourses/router_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  Timer?_timer;
_startDelay(){
  _timer=Timer(const Duration(seconds:AppConstants.SplashDelay),_goNext);
}
_goNext(){
  Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);

}
@override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo),)),
    );
  }
  @override
  void dispose() {
_timer?.cancel();
super.dispose();
  }
}
