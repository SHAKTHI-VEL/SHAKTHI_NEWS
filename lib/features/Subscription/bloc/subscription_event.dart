part of 'subscription_bloc.dart';

@immutable
sealed class SubscriptionEvent {}

class FetchSubscription extends SubscriptionEvent{}