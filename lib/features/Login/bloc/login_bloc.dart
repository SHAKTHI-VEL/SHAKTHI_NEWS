import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shakthi_news/features/Login/models/responseModel.dart';
import 'package:shakthi_news/features/Login/repos/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonClicked>(loginButtonClicked);
    on<ForgotPasswordButtonClicked>(forgotPasswordButtonClicked);
    on<SignupButtonClicked>(signupButtonClicked);
  }

  FutureOr<void> loginButtonClicked(LoginButtonClicked event, Emitter<LoginState> emit) async{
    Responsemodel response=await LoginRepo.login(event.email, event.password);
    if(response.success==true){
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token',response.token.toString());
      emit(NavigateToMainScreen());
    }else{
      emit(ShowWrongPasswordSnackbar(message: response.message));
    }
  }

  FutureOr<void> forgotPasswordButtonClicked(ForgotPasswordButtonClicked event, Emitter<LoginState> emit) {
    emit(NavigateToForgotPassword());
  }

  FutureOr<void> signupButtonClicked(SignupButtonClicked event, Emitter<LoginState> emit) {
    emit(NavigateToSignup());
  }
}
