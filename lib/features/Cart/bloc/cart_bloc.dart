import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shakthi_news/features/Cart/model/SubscriptionRouteModel.dart';
import 'package:shakthi_news/features/Cart/model/cartDeleteModel.dart';
import 'package:shakthi_news/features/Cart/model/dataModel.dart';
import 'package:shakthi_news/features/Cart/repos/Cart_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<DeleteButtonClicked>(deleteButtonClicked);
    on<AddtoSubscriptionClicked>(addtoSubscriptionClicked);
    on<CartFetch>(cartFetch);
  }

  FutureOr<void> deleteButtonClicked(DeleteButtonClicked event, Emitter<CartState> emit) async{
    Cartdeletemodel response=await CartRepo.deleteCart(event.id);
    if(response.success==true){
      emit(ShowSuccessfulScaffold(message: 'Item deleted'));
      Future.delayed(Duration(seconds: 5));
      emit(NavigateToMainScreen());
    }
  }

  FutureOr<void> addtoSubscriptionClicked(AddtoSubscriptionClicked event, Emitter<CartState> emit) async{
    SubscriptionRouteModel response=await CartRepo.addToSubscription();
    if(response.success==true){
      emit(ShowSuccessfulScaffold(message: 'Added to subscription successfully'));
      Future.delayed(Duration(seconds: 5));
      emit(NavigateToMainScreen());
    }
  }

  FutureOr<void> cartFetch(CartFetch event, Emitter<CartState> emit) async{
    ResponseModel response=await CartRepo.getCart();
    if(response.success==true){
      emit(CartFetchingState(newspapers: response.data));
    }
  }
}
