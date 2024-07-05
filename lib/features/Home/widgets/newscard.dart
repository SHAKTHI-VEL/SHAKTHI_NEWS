import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({super.key});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: InkWell(
        onTap: (){Navigator.pushNamed(context, 'papershowcase');},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(width * 0.018),
              ),
              // image: DecorationImage(image: AssetImage('assets/test.jpg'),fit: BoxFit.fill),
              color: Colors.grey.shade100),
          width: width * 0.39,
          height: height * 0.17,
          child: Column(
            children: [
              Container(
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/toi.jpeg'),fit:BoxFit.fill),
                  
                ),
              ),
              // Image(image: AssetImage('assets/test.jpg')),
              SizedBox(
                height: height * 0.0032,
              ),
        
              // mainAxisAlignment: MainAxisAlignment.center,
        
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Times Of India',
                      style: GoogleFonts.poppins(
                          fontSize: height * 0.016, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.006,
                  ),
                  Row(
                    children: [
                      Text(
                        'English',
                        style: GoogleFonts.poppins(
                          color:Colors.green.shade500,
                            fontSize: height * 0.016,
                            fontWeight: FontWeight.w600),
                      ),
                      
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
