import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakthi_news/features/Cart/bloc/cart_bloc.dart';
import 'package:shakthi_news/features/Cart/widgets/cart_card.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listener: (context, state) {
            // TODO: implement listener
          },
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is !CartActionState,
          builder: (context, state) {
            switch(state.runtimeType){
              case CartFetchingState:
                final successState=state as CartFetchingState;
                double sum=0;
                for(int i=0;i<successState.newspapers.length;i++){
                  sum+=double.parse(successState.newspapers[i]['newspaper_details']['price'].toString());
                }
                return Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Icon(CupertinoIcons.cart,
                        size: height * 0.05, color: Colors.orange),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      'Cart',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: height * 0.03),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.055,
                ),
                Expanded(
                  child: SizedBox(
                      // height: height*0.60,
                      child: ListView.builder(
                          itemCount: successState.newspapers.length,
                          itemBuilder: (context, index) {
                            return Cart_Card(newspaper: successState.newspapers[index],);
                          })),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.046),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.s,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '₹ ${sum.toString()}',
                        style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange.shade200),
                          alignment: Alignment.center,
                          // margin: EdgeInsets.symmetric(horizontal: 20),
                          width: width * 0.50,
                          height: height * 0.05,
                          child: Text('Add to Subscription'),
                          // color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
              ],
            );

            default:
              return const SizedBox();
            }
            
          },
        ),
      ),
    );
  }
}
