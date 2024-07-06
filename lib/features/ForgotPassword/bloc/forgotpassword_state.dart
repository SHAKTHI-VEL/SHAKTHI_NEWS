part of 'forgotpassword_bloc.dart';

@immutable
sealed class ForgotpasswordState {}

class ForgotpasswordActionState extends ForgotpasswordState{}

final class ForgotpasswordInitial extends ForgotpasswordState {}

class NavigateToOtpScreen extends ForgotpasswordActionState{
  final String email;

  NavigateToOtpScreen({required this.email});
}

class NavigateToNewPasswordScreen extends ForgotpasswordActionState{
  final String email;

  NavigateToNewPasswordScreen({required this.email});
}

class ShowErrorScaffold extends ForgotpasswordActionState{
  final String message;

  ShowErrorScaffold({required this.message});
}

class NavigateToLogin extends ForgotpasswordActionState{}