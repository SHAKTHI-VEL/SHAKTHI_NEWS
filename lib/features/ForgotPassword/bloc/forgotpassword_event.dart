part of 'forgotpassword_bloc.dart';

@immutable
sealed class ForgotpasswordEvent {}

class EmailContinueButtonClicked extends ForgotpasswordEvent{
  final String email;

  EmailContinueButtonClicked({required this.email});
}

class OTPContinueButtonClicked extends ForgotpasswordEvent{
  final String email;
  final String otp;

  OTPContinueButtonClicked({required this.email, required this.otp});
}

class ForgotContinueButtonClicked extends ForgotpasswordEvent{
  final String email;
  final String newpassword;
  final String password;
  final String otp;

  ForgotContinueButtonClicked({required this.email, required this.newpassword,required this.password,required this.otp});
}

class ReturntoLoginClicked extends ForgotpasswordEvent{}