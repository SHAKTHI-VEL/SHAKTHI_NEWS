part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class DeleteButtonClicked extends CartEvent{
  final String id;

  DeleteButtonClicked({required this.id});
}

class AddtoSubscriptionClicked extends CartEvent{}

class CartFetch extends CartEvent{}

