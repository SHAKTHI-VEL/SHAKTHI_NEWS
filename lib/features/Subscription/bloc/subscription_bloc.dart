import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shakthi_news/features/Subscription/models/responseModel.dart';
import 'package:shakthi_news/features/Subscription/repos/subscription_repo.dart';

part 'subscription_event.dart';
part 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc() : super(SubscriptionInitial()) {
    on<FetchSubscription>(fetchSubscription);
  }

  FutureOr<void> fetchSubscription(FetchSubscription event, Emitter<SubscriptionState> emit) async{
    ResponseModel response=await SubscriptionRepo.getSubscription();
    if(response.success==true){
      emit(SubscriptionFetchingState(newspapers: response.data));
    }
  }
  }
