import 'package:flutter/material.dart';
import 'package:shakthi_news/features/ForgotPassword/ui/forgotPassword.dart';
import 'package:shakthi_news/features/ForgotPassword/ui/newpassword.dart';
import 'package:shakthi_news/features/ForgotPassword/ui/otp.dart';
import 'package:shakthi_news/features/Login/ui/login.dart';
import 'package:shakthi_news/features/MainScreen/ui/mainscreen.dart';
import 'package:shakthi_news/features/PaperShowcase/ui/paperShowcase.dart';
import 'package:shakthi_news/features/Signup/ui/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: 'mainscreen',
      routes: {
        'login':(context)=>const Login(),
        'signup':(context)=>const Signup(),
        'forgotpassword':(context)=>const ForgotPassword(),
        'otp':(context)=>const OTP(),
        'newpassword':(context)=>const NewPassword(),
        'mainscreen':(context)=>const MainScreen(),
        'papershowcase':(context)=>const PaperShowcase()
      },
    );
  }
}
