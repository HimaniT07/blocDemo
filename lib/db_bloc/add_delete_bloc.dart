import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:himani_logbinary/utils/utility.dart';
import 'package:meta/meta.dart';

import '../database/db_repository.dart';
import '../model/db_model.dart';

part 'add_delete_event.dart';
part 'add_delete_state.dart';

class AddDeleteBloc extends Bloc<AddDeleteEvent, AddDeleteState> {
  final OrderDbRepository _orderDbRepository;

  AddDeleteBloc(this._orderDbRepository) : super(AddDeleteInitial()) {
    on<AddOrderEvent>((event, emit) async {
      emit(OrderAddingState());
      try {

        await _orderDbRepository.insertTodo(event.orderDbModel);
        List<OrderDbModel> orders = await _orderDbRepository.getAllOrders(); // to get all the orders
        Utility.snackBar('Total Orders : ${orders.length.toString()}', event.context);
        emit(OrderAddedState());
      } catch (e) {
        print(e.toString());
      }
    });

    on<DeleteOrderEvent>((event, emit) async {
      try {
        await _orderDbRepository.deleteAllTodos();
        Utility.snackBar('Data cleared!!', event.context);
        emit(OrderDeletedState());
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
