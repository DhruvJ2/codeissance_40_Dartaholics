import 'package:dartaholics/Screens/Dashboard.dart';
import 'package:dartaholics/Screens/EventsDescriptionScreen/events_details.dart';
import 'package:dartaholics/Screens/OnBoardingScreen/on_boarding.dart';
import 'package:dartaholics/Screens/Video_call/voice_call_screen.dart';
import 'package:dartaholics/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Screens/Dashboard.dart';
import 'Screens/login_screen.dart';
import 'Screens/signup_screen.dart';
import 'custom_navigation_bar/custom_navigation_drawer.dart';
import 'firebase_options.dart';
import 'providers/google_sign_in.dart';
import 'services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: AuthServices().user,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        routes: {
          '/': (context) => OnBoarding(),
          '/welcome': (context) => const WelcomePage(),
          '/login': (context) => Login(),
          '/sign-Up': (context) => SignUp(),
          '/custom-nav-drawer': (context) => const MainPage(),
          '/home': (context) => Board(),
          '/event-description': (context) => const EventsDetail(),
          '/voice-meetings': (context) => VoiceCall(),
          // '/user-list' :(context) =>
        },
      ),
    );
  }
}
