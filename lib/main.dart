import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_homy/firebase_options.dart';
import 'package:the_homy/onboarding.dart/onboarding_view.dart';
import 'package:the_homy/pages/homepage.dart';
import 'package:the_homy/pages/navigation_menu.dart';
import 'package:the_homy/pages/otp_screen.dart';
import 'package:the_homy/pages/test.dart';
import 'package:the_homy/provider/auth_provider.dart';
import 'package:the_homy/provider/services_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
        ChangeNotifierProvider(create: (_)=> ServiceProvider())
        
      ],
      child: MaterialApp(
          title: 'The Homy',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const OnboardingView(),
          
          ),
    );
  }
} 
