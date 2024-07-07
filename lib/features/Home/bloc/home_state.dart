part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeActionState extends HomeState{}

class FetchNewspaper extends HomeState{
  final List<dynamic> newspapers;

  FetchNewspaper({required this.newspapers});
}

class NavigateToPaperShowcase extends HomeActionState{
  final DataModel newspaper;

  NavigateToPaperShowcase({required this.newspaper});
}