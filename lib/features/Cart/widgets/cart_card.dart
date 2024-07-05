import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart_Card extends StatefulWidget {
  const Cart_Card({super.key});

  @override
  State<Cart_Card> createState() => _Cart_CardState();
}

class _Cart_CardState extends State<Cart_Card> {



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange.shade200
          ),
          width: width*0.93,
          height: height*0.13,
          child: Container(
            margin: EdgeInsets.all(width*0.02),
            child: Column(
              children: [
                SizedBox(height: height*0.006,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                          image: AssetImage('assets/toi.jpeg'),
                          height: height * 0.102,
                          fit: BoxFit.cover,
                        ),
                    ),
                    Column(
                      children: [
                        Text('Times of India', style: GoogleFonts.alice(
                                  fontSize: height * 0.020, fontWeight: FontWeight.w400),
                            ),
                          SizedBox(height: height*0.01,),
                          Text('₹ 6.0', style: GoogleFonts.alice(
                                  fontSize: height * 0.020, fontWeight: FontWeight.w400),
                            ),
                      ],
                    ),
                  Icon(Icons.delete_forever,size: 40,color: Colors.red.shade300,)  
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}