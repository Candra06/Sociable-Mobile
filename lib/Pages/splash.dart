import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sociable/Pages/Auth/Login/loginPage.dart';
import 'package:sociable/helper/pref.dart';
import 'package:sociable/helper/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();

    Future.delayed(Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacement(PageTransition(child: LoginPage(), type: PageTransitionType.fade));
      String token = await Pref.getToken();
      if (token == '' || token == null) {
        Navigator.of(context).pushReplacement(PageTransition(child: LoginPage(), type: PageTransitionType.fade));
      } else {
        Navigator.pushNamed(context, Routes.HOME);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ScaleTransition(
                scale: _animation,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 190.0,
                          width: 190.0,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Sociable', style: GoogleFonts.lato(fontWeight: FontWeight.w900, fontSize: 50))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
