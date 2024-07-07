part of 'subscription_bloc.dart';

@immutable
sealed class SubscriptionState {}

final class SubscriptionInitial extends SubscriptionState {}

class SubscriptionActionState extends SubscriptionState{}

class SubscriptionFetchingState extends SubscriptionState {
  final List<dynamic> newspapers;
  SubscriptionFetchingState({
    required this.newspapers,
  });
}