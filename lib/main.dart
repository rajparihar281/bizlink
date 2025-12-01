import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Import screens
import 'screens/splash/splash_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/signup_screen.dart';
import 'screens/main_container.dart'; // IMPORT THE NEW CONTAINER
import 'theme/colors.dart';

void main() {
  runApp(const BizLinkApp());
}

class BizLinkApp extends StatelessWidget {
  const BizLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BizLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(
              bodyColor: AppColors.textPrimary,
              displayColor: AppColors.textPrimary,
            ),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),

        // CRITICAL CHANGE: '/home' now points to MainContainer
        '/home': (context) => const MainContainer(),
      },
    );
  }
}
