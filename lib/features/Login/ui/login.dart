
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: const Image(image: AssetImage('assets/newspaper.png')),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                'Login',
                style: GoogleFonts.poppins(
                    fontSize: height * 0.04, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                width: width * 0.88,
                margin:
                    EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
                        style: GoogleFonts.poppins(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.w400)),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text('Password',
                        style: GoogleFonts.poppins(
                            fontSize: height * 0.025,
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
                      height: height * 0.035,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(
                                fontSize: height * 0.017,
                                color: Colors.orange.shade300),
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.035,
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
                              'Login',
                              style: GoogleFonts.poppins(
                                  fontSize: height * 0.025,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.08,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text.rich(
                        TextSpan(
                          text: 'Don\'t have an account?',
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.017,
                              fontWeight: FontWeight.w300),
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: InkWell(
                                onTap: (){},
                                child: Text(
                                  'Sign up',
                                  style: GoogleFonts.poppins(
                                      fontSize: height * 0.017,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.orange),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
