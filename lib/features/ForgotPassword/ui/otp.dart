import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakthi_news/features/ForgotPassword/bloc/forgotpassword_bloc.dart';
import 'package:shakthi_news/features/ForgotPassword/ui/newpassword.dart';

class OTP extends StatefulWidget {
  const OTP({super.key, this.email = ''});

  final String email;

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final ForgotpasswordBloc forgotpasswordBloc = ForgotpasswordBloc();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    final otpController = TextEditingController();
    String otpMerger='';


    late List<TextEditingController?> controls;

    String otp = '';

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<ForgotpasswordBloc, ForgotpasswordState>(
        bloc: forgotpasswordBloc,
        listenWhen: (previous, current) => current is ForgotpasswordActionState,
        buildWhen: (previous, current) => current is !ForgotpasswordActionState,
        listener: (context, state) {
          if(state is NavigateToNewPasswordScreen){
             Navigator.push(context, MaterialPageRoute(builder: (context){
              return NewPassword(email: widget.email,otp: otpMerger,);
            }));
          }else if(state is ShowErrorScaffold){
             final message=state as ShowErrorScaffold;
            var snackBar = SnackBar(
              content: Text(message.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }else if(state is NavigateToLogin){
            Navigator.popAndPushNamed(context, 'login');
          }
        },
        builder: (context, state) {
          return SafeArea(
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
                    },
                    handleControllers:(controllers) {
                      controls=controllers;
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
                          onPressed: () {
                            for(int i=0;i<6;i++){
                              otpMerger+=controls[i]!.text;
                            }
                            forgotpasswordBloc.add(OTPContinueButtonClicked(email: widget.email, otp: otpMerger));
                          },
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
                      onTap: () {
                        forgotpasswordBloc.add(ReturntoLoginClicked());
                      },
                      child: Text(
                        'Return to Login',
                        style: GoogleFonts.poppins(
                            fontSize: height * 0.017,
                            fontWeight: FontWeight.w300,
                            color: Colors.orange),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
