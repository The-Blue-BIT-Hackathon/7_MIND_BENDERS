




//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:visualizegrow/sign%20in/signin.dart';
import 'package:visualizegrow/signup/signup.dart';

import 'home/components/SplashScreen.dart';
import 'home/homescreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName:(context)=>SplashScreen(),
  // MobileLogin.routeName:(context)=>MobileLogin(),
  // ProfileScreen.routeName:(context)=>ProfileScreen(),
  // LoginSuccessScreen.routeName:(context)=>LoginSuccessScreen(),
   'home':(context)=>HomeScreen(),
  // 'login_sucess':(context)=>LoginSuccessScreen(),
   SignInScreen.routeName:(context)=>SignInScreen(),
   SignUpScreen.routeName: (context) => SignUpScreen(),
  // ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),



};
