import '../model/db_model.dart';
import 'database.dart';

class OrderDao{

  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createOrder(OrderDbModel order) async {
    final db = await dbProvider.database;
    if(await isContainData(order) == false){ // to prevent duplicate
      return db!.insert(orderTABLE, order.toDatabaseJson());
    }
    return 0;
  }

  Future<List<OrderDbModel>> getOrders() async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    result = await db!.query(orderTABLE);

    List<OrderDbModel> ordersList = result.isNotEmpty
        ? result.map((item) => OrderDbModel.fromDatabaseJson(item)).toList()
        : [];
    return ordersList;
  }


  //We are not going to use this in the demo
  Future deleteAllTodos() async {
    final db = await dbProvider.database;
    var result = await db!.delete(
      orderTABLE,
    );
    return result;
  }

  Future<bool> isContainData(OrderDbModel order) async {
    var containsData = false;

    List<OrderDbModel> orderL = await getOrders();
    for(int i = 0;i<orderL.length;i++){
      if(orderL[i].orderId == order.orderId){
        containsData = true;
        return containsData;
      }
    }
    return containsData;

  }


}