import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sociable/helper/appConfig.dart';
import 'package:sociable/helper/route.dart';
void main() {
  MyApp.initSystemDefault();

  runApp(AppConfig(appName: "Sociable", flavorName: "dev", initialRoute: Routes.SPLASH, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var initialRoute = AppConfig.of(context).initialRoute;
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: initialRoute,
      title: 'Sociable',
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }
}
// void main(){
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.blue
//   ));
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return LoginPage();
//   }
// }
