part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class LoadOrderEvent extends OrderEvent {
  @override
  List<Object?> get props => [];
}
