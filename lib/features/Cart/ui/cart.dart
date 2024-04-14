import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height*0.02,),
            Row(
              children: [
                SizedBox(width: width*0.04,),
                Icon(CupertinoIcons.cart,size: height*0.05,color: Colors.orange),
                SizedBox(width:width*0.03,),
                Text('Cart',style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:height*0.03),),
                
              ],
            )
          ],
        ),
      ),
      
    );
  }
}
