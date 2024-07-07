import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shakthi_news/features/PaperShowcase/models/responseModel.dart';
import 'package:shakthi_news/features/PaperShowcase/repos/paperShowcase_repo.dart';

part 'papershowcase_event.dart';
part 'papershowcase_state.dart';

class PapershowcaseBloc extends Bloc<PapershowcaseEvent, PapershowcaseState> {
  PapershowcaseBloc() : super(PapershowcaseInitial()) {
    on<AddToCartClicked>(addToCartClicked);
  }

  FutureOr<void> addToCartClicked(AddToCartClicked event, Emitter<PapershowcaseState> emit) async{
    ResponseModel response=await PapershowcaseRepo.addToCart(event.id);
    if(response.success==true){
      emit(AddedtoCartSuccessfullyScaffold(message: response.message));
      Future.delayed(const Duration(seconds: 3));
      emit(NavigateToMainScreen());
    }else{
      emit(AddeddtoCartFailedScaffold(message: response.message));
    }
  }
}
