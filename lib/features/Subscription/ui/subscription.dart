import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakthi_news/features/Subscription/bloc/subscription_bloc.dart';
import 'package:shakthi_news/features/Subscription/widgets/sub_card.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {

  final SubscriptionBloc subscriptionBloc=SubscriptionBloc();

  @override
  void initState() {
    subscriptionBloc.add(FetchSubscription());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: BlocConsumer<SubscriptionBloc, SubscriptionState>(
        bloc: subscriptionBloc,
        listenWhen: (previous, current) => current is SubscriptionActionState,
        buildWhen: (previous, current) => current is !SubscriptionActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch(state.runtimeType){
            case SubscriptionFetchingState:
                final successState=state as SubscriptionFetchingState;
          return SafeArea(
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
                    Icon(CupertinoIcons.money_pound,
                        size: height * 0.05, color: Colors.orange),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      'Subscription',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: height * 0.03),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.040,
                ),
                Expanded(
                  child: SizedBox(
                      // height: height*0.60,
                      child: ListView.builder(
                          itemCount: successState.newspapers.length,
                          itemBuilder: (context, index) {
                            return SubCard(newspaper: successState.newspapers[index],);
                          })),
                ),
              ],
            ),
          );
          default:
          return SizedBox();
          }
        },
      ),
    );
  }
}
