import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shakthi_news/features/Home/models/datamodel.dart';
import 'package:shakthi_news/features/Home/models/responsemodel.dart';
import 'package:shakthi_news/features/Home/repos/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NewspaperFetchEvent>(newspaperFetchEvent);
    on<NewspaperCardClickedEvent>(newspaperCardClickedEvent);
  }

  FutureOr<void> newspaperFetchEvent(NewspaperFetchEvent event, Emitter<HomeState> emit) async{
    ResponseModel response=await HomeRepo.getNewspaper();
    if(response.success==true){
      log('true');
      emit(FetchNewspaper(newspapers: response.data));
    }
  }

  FutureOr<void> newspaperCardClickedEvent(NewspaperCardClickedEvent event, Emitter<HomeState> emit) {
    emit(NavigateToPaperShowcase(newspaper: event.newspaper));
  }
}
