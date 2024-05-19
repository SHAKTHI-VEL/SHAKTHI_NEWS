import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    final emailController = TextEditingController();
    String otp = '';

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              Text(
                'Forgot Password',
                style: GoogleFonts.poppins(
                    fontSize: height * 0.04, fontWeight: FontWeight.bold),
              ),
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('assets/forgotpassword.png'),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text('Enter 6 digit code sent to your email',
                  style: GoogleFonts.poppins(fontSize: height * 0.015)),
              SizedBox(
                height: height * 0.050,
              ),
              Text(
                'Enter the code',
                style: GoogleFonts.poppins(
                    fontSize: height * 0.02, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: false,
                onSubmit: (String verificationCode) {
                  setState(() {
                    otp = verificationCode;
                  });
                  log(otp);
                },
              ),
              SizedBox(
                height: height * 0.085,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.81,
                    height: height * 0.064,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {},
                      child: Text(
                        'Continue',
                        style: GoogleFonts.poppins(
                            fontSize: height * 0.025, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.085,
              ),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (){},
                  child: Text(
                    'Return to Login',
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.017, fontWeight: FontWeight.w300,color:Colors.orange),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
