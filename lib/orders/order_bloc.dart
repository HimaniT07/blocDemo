import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/doctor_data_model.dart';
import '../repository/repositories.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;

  OrderBloc(this._orderRepository) : super(OrderLoadingState()) {
    on<LoadOrderEvent>((event, emit) async {
      emit(OrderLoadingState());
      try {
        final orders = await _orderRepository.getOrders();
        emit(OrderLoadedState(orders));
      } catch (e) {
        emit(OrderErrorState(e.toString()));
      }
    });
  }
}
