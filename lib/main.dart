import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:himani_logbinary/model/db_model.dart';
import 'package:himani_logbinary/orders/order_bloc.dart';
import 'package:himani_logbinary/repository/repositories.dart';
import 'package:himani_logbinary/utils/app_constants.dart';
import 'package:himani_logbinary/utils/color_constants.dart';
import 'package:himani_logbinary/utils/dimensions.dart';
import 'package:himani_logbinary/utils/utility.dart';
import 'database/db_repository.dart';
import 'db_bloc/add_delete_bloc.dart';
import 'model/doctor_data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<OrderBloc>(
            create: (BuildContext context) => OrderBloc(OrderRepository()),
          ),
          BlocProvider<AddDeleteBloc>(
            create: (BuildContext context) =>
                AddDeleteBloc(OrderDbRepository()),
          ),
        ],
        child: Scaffold(
            appBar: AppBar(
                title: const Text(AppConstants.appName),
                backgroundColor: ColorConstants.appColor),
            floatingActionButton: BlocBuilder<AddDeleteBloc, AddDeleteState>(
              builder: (context, state) {
                return FloatingActionButton(
                  onPressed: () {
                    AddDeleteBloc(OrderDbRepository()).add(DeleteOrderEvent(context)); //to delete
                  },
                  backgroundColor: ColorConstants.appColor,
                  child: const Icon(
                    Icons.delete,
                    color: ColorConstants.white,
                  ),
                );
              },
            ),
            body: blocBody()),
      ),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => OrderBloc(OrderRepository())..add(LoadOrderEvent()),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoadingState) {
            return const CircularProgressIndicator();
          }
          if (state is OrderErrorState) {
            return Center(child: Text(state.error));
          }
          if (state is OrderLoadedState) {
            final List<Orders> orders = state.orders;
            return orderListBody(orders, context);
          }
          return const Center(child: Text(AppConstants.somethingWrong));
        },
      ),
    );
  }

  Widget orderListBody(List<Orders> orders, BuildContext context) {
    return BlocBuilder<AddDeleteBloc, AddDeleteState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  OrderDbModel orderDbModel = OrderDbModel();
                  orderDbModel.orderId = orders[index].orderId;
                  orderDbModel.sequenceNo = orders[index].sequenceNo;
                  orderDbModel.orderType = orders[index].orderType;
                  orderDbModel.expectedDate = orders[index].expectedDate;
                  AddDeleteBloc(OrderDbRepository()).add(AddOrderEvent(orderDbModel,context));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${AppConstants.orderId} ${orders[index].orderId.toString()}',
                            style: TextStyle(
                                fontSize: Dimensions.fontSizeDefault,
                                color: ColorConstants.appColor)),
                        addDefaultGap(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${AppConstants.sequenceNo} ${orders[index].sequenceNo.toString()}',
                                style: TextStyle(
                                    fontSize: Dimensions.fontSizeDefault,
                                    color: ColorConstants.appColor)),
                            Text(
                                '${AppConstants.isPrime} ${Utility.checkIfSequenceIsPrime(orders[index].sequenceNo!).toString()}',
                                style: TextStyle(
                                    fontSize: Dimensions.fontSizeDefault,
                                    color: ColorConstants.appColor)),
                          ],
                        ),
                        addDefaultGap(),
                        Text(
                            '${AppConstants.orderType} ${orders[index].orderType}',
                            style: TextStyle(
                                fontSize: Dimensions.fontSizeDefault,
                                color: ColorConstants.appColor)),
                        addDefaultGap(),
                        Text(
                            '${AppConstants.expectedDate} ${Utility.dateConverter(orders[index].expectedDate.toString())}',
                            style: TextStyle(
                                fontSize: Dimensions.fontSizeDefault,
                                color: ColorConstants.appColor)),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }

  addDefaultGap() {
    return SizedBox(height: Dimensions.gap10);
  }
}
