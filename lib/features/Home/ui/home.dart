import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakthi_news/features/Home/widgets/newscard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.04,
                ),
                Icon(CupertinoIcons.home,
                    size: height * 0.05, color: Colors.orange),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  'Home',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: height * 0.03),
                ),
                SizedBox(
                  height: height * 0.09,
                )
              ],
            ),
            Card(
              elevation: 3,
              color: Colors.amber.shade400,
              child: Row(
                children: [
                  const SizedBox(
                    width: 3,
                  ),
                  Container(
                    height: height * 0.107,
                    width: width * 0.655,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(width * 0.011),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                        margin: EdgeInsets.only(top: height * 0.005),
                        child: Text(
                          'Every paper sold is a bridge between information and the curious mind.',
                          style: GoogleFonts.podkova(
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                  SizedBox(width: width*0.010,),
                  Image(
                    image: AssetImage('assets/news.png'),
                    height: height * 0.107,
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Discover',
                    style: GoogleFonts.poppins(fontSize: height * 0.025),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: width*0.08),
                    width: width,
                    height: height * 0.783,
                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
                      return NewsCard();
                    },itemCount: 10,),)
            )
          ],
        ),
      ),
    );
  }
}
