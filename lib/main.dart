import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/screens/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:AnimatedSplashScreen(
        duration: 4000,
        splash: Image.asset("images/splash.jpg",width:double.infinity, fit:BoxFit.cover,),
        nextScreen:HomeScreen(),
        //calling the page which have the tab bar view as next screen
        splashIconSize:double.infinity,
        //make the icon to cover all space around
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor:Colors.black87,
      )
    );
  }
}

