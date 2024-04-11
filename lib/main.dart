import 'package:flutter/material.dart';
import 'package:shakthi_news/features/Login/ui/login.dart';
import 'package:shakthi_news/features/Signup/ui/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: 'signup',
      routes: {
        'login':(context)=>const Login(),
        'signup':(context)=>const Signup()
      },
    );
  }
}
