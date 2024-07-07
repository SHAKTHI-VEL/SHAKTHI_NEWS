part of 'papershowcase_bloc.dart';

@immutable
sealed class PapershowcaseEvent {}

class AddToCartClicked extends PapershowcaseEvent{
  final String id;

  AddToCartClicked({required this.id});
}