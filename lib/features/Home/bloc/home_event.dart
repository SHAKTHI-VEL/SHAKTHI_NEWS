part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class NewspaperFetchEvent extends HomeEvent{}

class NewspaperCardClickedEvent extends HomeEvent{
  final dynamic newspaper;

  NewspaperCardClickedEvent({required this.newspaper});
}