part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

class SignupActionState extends SignupState{}

final class SignupInitial extends SignupState {}

class NavigateToMainScreen extends SignupActionState{}

class NavigateToLoginScreen extends SignupActionState{}

class ShowWrongPasswordSnackbar extends SignupActionState{
  final String message;

  ShowWrongPasswordSnackbar({required this.message});
}