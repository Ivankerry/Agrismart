import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/features/app/splash_screen/splash_screen.dart';
import 'package:myapp/features/user_auth/presentation/pages/home_page.dart';
import 'package:myapp/features/user_auth/presentation/pages/login_page.dart';
import 'package:myapp/features/user_auth/presentation/pages/sign_up_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBhsxJ5GUt5L3MHGrdbylKPCRxs8Nnvv-8",
        authDomain: "myagrismartapp.firebaseapp.com",
        projectId: "myagrismartapp",
        storageBucket: "myagrismartapp.firebasestorage.app",
        messagingSenderId: "1068617168576",
        appId: "1:1068617168576:web:ec894f0b3d569bf1dd9f25",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MaterialColor customGreen = MaterialColor(0xFF4CAF50, <int, Color>{
      50: const Color(0xFFE8F5E9),
      100: const Color(0xFFC8E6C9),
      200: const Color(0xFFA5D6A7),
      300: const Color(0xFF81C784),
      400: const Color(0xFF66BB6A),
      500: const Color(0xFF4CAF50),
      600: const Color(0xFF43A047),
      700: const Color(0xFF388E3C),
      800: const Color(0xFF2E7D32),
      900: const Color(0xFF1B5E20),
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriSmart',
      theme: ThemeData(primarySwatch: customGreen),
      routes: {
        '/': (context) => SplashScreen(child: LoginPage()),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
