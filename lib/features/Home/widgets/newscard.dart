import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakthi_news/features/Home/models/datamodel.dart';
import 'package:shakthi_news/features/PaperShowcase/ui/paperShowcase.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({super.key,required this.newspaper});

  final dynamic newspaper;

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
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaperShowcase(newspaper: widget.newspaper,)));
        },
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
                  image: DecorationImage(image: AssetImage(widget.newspaper['imageUrl']),fit:BoxFit.fill),
                  
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
                      widget.newspaper['name'],
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
                        widget.newspaper['language'],
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
