import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shakthi_news/features/Signup/models/responseModel.dart';
import 'package:shakthi_news/features/Signup/repos/signup_repo.dart';


part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
   on<SignupButtonClicked>(signupButtonClicked);
   on<LoginButtonClicked>(loginButtonClicked);
  }

  FutureOr<void> signupButtonClicked(SignupButtonClicked event, Emitter<SignupState> emit) async{
    Responsemodel response=await SignupRepo.signup(event.email, event.password);
    if(response.success==true){
      emit(NavigateToMainScreen());
    }else{
      emit(ShowWrongPasswordSnackbar(message: response.message));
    }
  }

  FutureOr<void> loginButtonClicked(LoginButtonClicked event, Emitter<SignupState> emit) {
    emit(NavigateToLoginScreen());
  }
}
