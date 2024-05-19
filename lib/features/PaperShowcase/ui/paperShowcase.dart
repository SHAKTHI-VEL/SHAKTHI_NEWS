// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaperShowcase extends StatefulWidget {
  const PaperShowcase({super.key});

  @override
  State<PaperShowcase> createState() => _PaperShowcaseState();
}

class _PaperShowcaseState extends State<PaperShowcase> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Description'),
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          Container(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage('assets/toi.jpeg'),
              fit: BoxFit.fill,
              height: height * 0.19,
            ),
          ),
          SizedBox(
            height: height * 0.09,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Times of India',
                  style: GoogleFonts.podkova(fontSize: height * 0.034),
                ),
                SizedBox(
                  height: height*0.016,
                ),
                Text(
                  'The Times of India, also known by its abbreviation TOI, is an Indian English-language daily newspaper and digital news media owned and managed by The Times Group. It is the fourth-largest newspaper in India by circulation and largest selling English-language daily in the world.',
                  style: GoogleFonts.poppins(),
                ),
                SizedBox(
                  height: height*0.20,
                ),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.orange,),
                  width: width,
                  height: height*0.06,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width*0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('₹ 6.0',style: TextStyle(fontSize:height*0.02,fontWeight: FontWeight.bold),),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                            alignment: Alignment.center,
                            // margin: EdgeInsets.symmetric(horizontal: 20),
                            width: width*0.30,
                            height: height*0.04,
                            child: Text('Add to cart'),
                            // color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
