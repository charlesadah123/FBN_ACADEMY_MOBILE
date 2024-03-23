import 'dart:async';
import 'package:fbn_academy_mobile/screens/authentication/OnBoardingScreen.dart';
import 'package:fbn_academy_mobile/screens/dashboard/DashboardScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../screens/authentication/LoginScreen.dart';
class SplashController extends GetxController with GetSingleTickerProviderStateMixin{


  // var visible = true;
  late Widget ilogo ;
  late AnimationController animationController;
  late Animation<double> animation;
  

  @override
  void onInit() {
   initializeAnimation();
    startTimeOut();
    super.onInit();
  }

  @override
  void on(){


  }




  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }


  void initializeAnimation(){
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => update());
    animationController.forward();

    ilogo = Center(child: SvgPicture.asset('assets/images/fbn_logo.svg'));
  }

  navigationPage() async {
    final isAuth = await checkFirebaseAuth(); // Check Firebase Authentication
    if (isAuth) {
      Get.offAll(() =>  DashboardScreen());
    } else {
      Get.offAll(() =>  LoginScreen());
    }
  }


  Future<bool> checkFirebaseAuth() async {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }


  startTimeOut() {
    var duration =  const Duration(seconds: 3);
    return Timer(duration, navigationPage);
  }


}