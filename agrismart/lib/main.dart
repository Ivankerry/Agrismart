import 'package:agrismart/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:agrismart/firebase_options.dart';
import 'package:agrismart/pages/splash_screen.dart'; // Importing the Material package.

void main() async {
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

    runApp(const MyApp());
  } 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MaterialColor customGreen = MaterialColor(
      0xFF4CAF50,
      <int, Color>{
        50: Color(0xFFE8F5E9),
        100: Color(0xFFC8E6C9),
        200: Color(0xFFA5D6A7),
        300: Color(0xFF81C784),
        400: Color(0xFF66BB6A),
        500: Color(0xFF4CAF50),
        600: Color(0xFF43A047),
        700: Color(0xFF388E3C),
        800: Color(0xFF2E7D32),
        900: Color(0xFF1B5E20),
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriSmart',
      theme: ThemeData(primarySwatch: customGreen),
      initialRoute: '/',
            routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) =>  LoginPage(),
        // Add more routes as needed
      },

    );
  }
}
