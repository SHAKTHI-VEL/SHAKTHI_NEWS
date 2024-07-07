import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakthi_news/features/Cart/bloc/cart_bloc.dart';

class Cart_Card extends StatefulWidget {
  const Cart_Card({super.key, this.newspaper = ''});

  final dynamic newspaper;

  @override
  State<Cart_Card> createState() => _Cart_CardState();
}

class _Cart_CardState extends State<Cart_Card> {
  final CartBloc cartBloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is !CartActionState,
      listener: (context, state) {
        if(state is ShowSuccessfulScaffold){
            final message=state;
            var snackBar = SnackBar(
              content: Text(message.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }else if(state is NavigateToMainScreen){
            Navigator.popAndPushNamed(context, 'mainscreen');
          }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange.shade200),
              width: width * 0.93,
              height: height * 0.13,
              child: Container(
                margin: EdgeInsets.all(width * 0.02),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.006,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image(
                            image: AssetImage(widget
                                .newspaper['newspaper_details']['imageUrl']),
                            height: height * 0.102,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              widget.newspaper['newspaper_details']['name'],
                              style: GoogleFonts.alice(
                                  fontSize: height * 0.020,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              '₹ ${widget.newspaper['newspaper_details']['price']}',
                              style: GoogleFonts.alice(
                                  fontSize: height * 0.020,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: () {
                              cartBloc.add(DeleteButtonClicked(
                                  id: widget.newspaper['_id']));
                            },
                            child: Icon(
                              Icons.delete_forever,
                              size: 40,
                              color: Colors.red.shade300,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }
}
