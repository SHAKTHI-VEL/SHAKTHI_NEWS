import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCard extends StatefulWidget {
  const SubCard({super.key});

  @override
  State<SubCard> createState() => _SubCardState();
}

class _SubCardState extends State<SubCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: 75,
      width: 350,
      child: Card(
        color: Colors.orange.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Times of India',
                  style: GoogleFonts.alice(fontSize: 16),
                ),
                SizedBox(width: 140,),
                Text('Price:₹ 6.0',style: GoogleFonts.aBeeZee(fontSize:14),)
              ],
            ),
            SizedBox(height:10),
          Row(
            children: [
                SizedBox(width: 10),
              Text('Start Date:-12/12/2009',style: GoogleFonts.alice(fontSize:15),),
                SizedBox(width: 60,),
              Text('Validity:30 days',style: GoogleFonts.alice(fontSize:15),)
            ],
          )
          ],
        ),
      ),
    );
  }
}
