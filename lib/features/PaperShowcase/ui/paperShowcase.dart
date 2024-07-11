// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakthi_news/features/MainScreen/ui/mainscreen.dart';
import 'package:shakthi_news/features/PaperShowcase/bloc/papershowcase_bloc.dart';

class PaperShowcase extends StatefulWidget {
  const PaperShowcase({super.key, this.newspaper = ''});

  final dynamic newspaper;

  @override
  State<PaperShowcase> createState() => _PaperShowcaseState();
}

class _PaperShowcaseState extends State<PaperShowcase> {
  final PapershowcaseBloc papershowcaseBloc = PapershowcaseBloc();
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
      body: BlocConsumer<PapershowcaseBloc, PapershowcaseState>(
        bloc: papershowcaseBloc,
        listenWhen: (previous, current) => current is PaperShowcaseActionState,
        buildWhen: (previous, current) => current is !PaperShowcaseActionState,
        listener: (context, state) {
          if(state is AddedtoCartSuccessfullyScaffold){
            final message=state;
            var snackBar = SnackBar(
              content: Text(message.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }else if(state is AddeddtoCartFailedScaffold){
            final message=state;
            var snackBar = SnackBar(
              content: Text(message.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }else if(state is NavigateToMainScreen){
            Navigator.popAndPushNamed(context, '/mainscreen');
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                height: height * 0.25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.newspaper['imageUrl']),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.newspaper['name'],
                      style: GoogleFonts.podkova(fontSize: height * 0.034),
                    ),
                    SizedBox(
                      height: height * 0.016,
                    ),
                    Text(
                      widget.newspaper['description'],
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(
                      height: height * 0.30,
                    ),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      width: width,
                      height: height * 0.06,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₹${widget.newspaper['price']}',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                papershowcaseBloc.add(AddToCartClicked(
                                    id: widget.newspaper['_id']));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                alignment: Alignment.center,
                                // margin: EdgeInsets.symmetric(horizontal: 20),
                                width: width * 0.30,
                                height: height * 0.04,
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
          );
        },
      ),
    );
  }
}
