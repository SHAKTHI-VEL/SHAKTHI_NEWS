part of 'papershowcase_bloc.dart';

@immutable
sealed class PapershowcaseState {}

class PaperShowcaseActionState extends PapershowcaseState{}

final class PapershowcaseInitial extends PapershowcaseState {}

class NavigateToMainScreen extends PaperShowcaseActionState{}

class AddedtoCartSuccessfullyScaffold extends PaperShowcaseActionState{
  final String message;

  AddedtoCartSuccessfullyScaffold({required this.message});
}

class AddeddtoCartFailedScaffold extends PaperShowcaseActionState{
  final String message;

  AddeddtoCartFailedScaffold({required this.message});
}
