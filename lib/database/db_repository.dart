import 'package:himani_logbinary/model/db_model.dart';

import 'dao.dart';

class OrderDbRepository {

  final orderDao = OrderDao();

  Future insertTodo(OrderDbModel order) => orderDao.createOrder(order);

  Future deleteAllTodos() => orderDao.deleteAllTodos();

  Future getAllOrders() => orderDao.getOrders();

}
