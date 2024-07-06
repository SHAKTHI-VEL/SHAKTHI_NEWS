import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shakthi_news/features/ForgotPassword/models/ResponseModel.dart';
import 'package:shakthi_news/features/ForgotPassword/repos/forgotpassword_repo.dart';

part 'forgotpassword_event.dart';
part 'forgotpassword_state.dart';

class ForgotpasswordBloc extends Bloc<ForgotpasswordEvent, ForgotpasswordState> {
  ForgotpasswordBloc() : super(ForgotpasswordInitial()) {
    on<EmailContinueButtonClicked>(emailcontinueButtonClicked);
    on<OTPContinueButtonClicked>(otpContinueButtonClicked);
    on<ReturntoLoginClicked>(returntoLoginClicked);
    on<ForgotContinueButtonClicked>(forgotContinueButtonClicked);
  }

  FutureOr<void> emailcontinueButtonClicked(EmailContinueButtonClicked event, Emitter<ForgotpasswordState> emit) async{
    Responsemodel response=await ForgotpasswordRepo.requestotp(event.email);
    if(response.success==true){
      emit(NavigateToOtpScreen(email: event.email));
    }else{
      emit(ShowErrorScaffold(message: response.message));
    }
  }

  FutureOr<void> otpContinueButtonClicked(OTPContinueButtonClicked event, Emitter<ForgotpasswordState> emit) async{
    Responsemodel response=await ForgotpasswordRepo.authOtp(event.email, event.otp);
    if(response.success==true){
      emit(NavigateToNewPasswordScreen(email: event.email));
    }else{
      emit(ShowErrorScaffold(message: response.message));
    }
  }

  FutureOr<void> returntoLoginClicked(ReturntoLoginClicked event, Emitter<ForgotpasswordState> emit) {
    emit(NavigateToLogin());
  }

  FutureOr<void> forgotContinueButtonClicked(ForgotContinueButtonClicked event, Emitter<ForgotpasswordState> emit) async{
    if(event.newpassword!=event.password){
      emit(ShowErrorScaffold(message: 'Password do not match'));
    }else{
      Responsemodel response=await ForgotpasswordRepo.newpassword(event.email, event.password,event.otp);
      if(response.success==true){
        emit(NavigateToLogin());
      }else{
        emit(ShowErrorScaffold(message: response.message));
      }
    }
  }
}
