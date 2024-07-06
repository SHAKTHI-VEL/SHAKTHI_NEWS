import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakthi_news/features/ForgotPassword/bloc/forgotpassword_bloc.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key, this.email = '',this.otp=''});

  final String email;
  final String otp;
  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final ForgotpasswordBloc forgotpasswordBloc = ForgotpasswordBloc();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final passwordController = TextEditingController();
    final confirmpasswordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<ForgotpasswordBloc, ForgotpasswordState>(
        bloc: forgotpasswordBloc,
        listenWhen: (previous, current) => current is ForgotpasswordActionState,
        buildWhen: (previous, current) => current is !ForgotpasswordActionState,
        listener: (context, state) {
          if(state is NavigateToLogin){
            Navigator.popAndPushNamed(context, 'login');
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.16,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.poppins(
                          fontSize: height * 0.04, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Set a new password',
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.02, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: height * 0.085,
                  ),
                  Container(
                    width: width * 0.88,
                    margin: EdgeInsets.only(
                        left: width * 0.03, right: width * 0.03),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('New Password',
                              style: GoogleFonts.poppins(
                                  fontSize: height * 0.020,
                                  fontWeight: FontWeight.w400)),
                          TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text('Repeat New Password',
                              style: GoogleFonts.poppins(
                                  fontSize: height * 0.020,
                                  fontWeight: FontWeight.w400)),
                          TextField(
                            obscureText: true,
                            controller: confirmpasswordController,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
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
                                    forgotpasswordBloc.add(ForgotContinueButtonClicked(email: widget.email, newpassword: passwordController.text, password: confirmpasswordController.text,otp:widget.otp));
                                  },
                                  child: Text(
                                    'Continue',
                                    style: GoogleFonts.poppins(
                                        fontSize: height * 0.025,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.19,
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
                        ]),
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
