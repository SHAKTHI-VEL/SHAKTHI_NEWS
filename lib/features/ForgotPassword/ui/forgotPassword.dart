import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakthi_news/features/ForgotPassword/bloc/forgotpassword_bloc.dart';
import 'package:shakthi_news/features/ForgotPassword/ui/otp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final ForgotpasswordBloc forgotpasswordBloc = ForgotpasswordBloc();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    final emailController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<ForgotpasswordBloc, ForgotpasswordState>(
        bloc: forgotpasswordBloc,
        listenWhen: (previous, current) => current is ForgotpasswordActionState,
        buildWhen: (previous, current) => current is !ForgotpasswordActionState,
        listener: (context, state) {
          if(state is NavigateToOtpScreen){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return OTP(email: emailController.text,);
            }));
          }else if (state is ShowErrorScaffold) {
            final message=state as ShowErrorScaffold;
            var snackBar = SnackBar(
              content: Text(message.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  Container(
                    width: width * 0.88,
                    margin: EdgeInsets.only(
                        left: width * 0.03, right: width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.025,
                              fontWeight: FontWeight.w400),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ],
                    ),
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
                            forgotpasswordBloc.add(EmailContinueButtonClicked(email: emailController.text));
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
