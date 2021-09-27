import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sociable/MainPage.dart';
import 'package:sociable/Pages/Akun/akun.dart';
import 'package:sociable/Pages/Auth/Login/loginPage.dart';
import 'package:sociable/Pages/Auth/Registrasi/registrationPage.dart';
import 'package:sociable/Pages/splash.dart';

class Routes {
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String HOME = '/home';
  static const String AKUN = '/akun';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN:
        return PageTransition(child: LoginPage(), type: PageTransitionType.leftToRight);
      case REGISTER:
        return PageTransition(child: RegistrationPage(), type: PageTransitionType.leftToRight);
      case HOME:
        return PageTransition(child: MainPage(), type: PageTransitionType.leftToRight);
      // case AKUN:
      //   var data = settings.arguments;
      //   return PageTransition(
      //       child: AkunPage(
      //         idUser: 1,
      //         namaUser: '',
      //       ),
      //       type: PageTransitionType.leftToRight);
      // case TAB:
      //   return PageTransition(
      //       child: Tabs(
      //         indexPage: settings.arguments,
      //       ),
      //       type: PageTransitionType.leftToRight);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Page ${settings.name} not defined'),
                  ),
                ));
    }
  }
}
