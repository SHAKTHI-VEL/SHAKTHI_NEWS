import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCard extends StatefulWidget {
  const SubCard({super.key,this.newspaper=''});

  final dynamic newspaper;

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 10),
                Text(
                  widget.newspaper['newspaper_details']['name'],
                  style: GoogleFonts.alice(fontSize: 16),
                ),
                SizedBox(width: 140,),
                Text('Price:₹ ${widget.newspaper['newspaper_details']['price']}',style: GoogleFonts.aBeeZee(fontSize:14),)
              ],
            ),
            SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                SizedBox(width: 10),
              Text('Start Date:-${widget.newspaper['createdAt'].toString().substring(0,10)}',style: GoogleFonts.alice(fontSize:15),),
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
