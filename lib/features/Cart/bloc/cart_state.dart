// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

class CartActionState extends CartState{}

final class CartInitial extends CartState {}

class AddToSubcription extends CartActionState{}

class CartFetchingState extends CartState {
  final List<dynamic> newspapers;
  CartFetchingState({
    required this.newspapers,
  });
}

class NavigateToMainScreen extends CartActionState{}

class ShowSuccessfulScaffold extends CartActionState{
  final String message;

  ShowSuccessfulScaffold({required this.message});
}