part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();
}

class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}

class OrderLoadingState extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderLoadedState extends OrderState {
  final List<Orders> orders;
  const OrderLoadedState(this.orders);
  @override
  List<Object?> get props => [orders];
}

class OrderErrorState extends OrderState {
  final String error;
  const OrderErrorState(this.error);
  @override
  List<Object?> get props => [error];
}