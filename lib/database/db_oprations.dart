
import 'package:himani_logbinary/database/database.dart';

import '../model/db_model.dart';

class DbOperations {

  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new order
  Future<int> addOrder(OrderDbModel oder) async {
    final db = await dbProvider.database;
    var result = db!.insert(orderTABLE, oder.toDatabaseJson());
    return result;
  }
  // delete data
  Future deleteAllOrders() async {
    final db = await dbProvider.database;
    var result = await db!.delete(
      orderTABLE,
    );
    return result;
  }


}
