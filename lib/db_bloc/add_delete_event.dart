part of 'add_delete_bloc.dart';

@immutable
abstract class AddDeleteEvent {}

class AddOrderEvent extends AddDeleteEvent {
  OrderDbModel orderDbModel;
  BuildContext context;
  AddOrderEvent(this.orderDbModel,this.context);
}

class DeleteOrderEvent extends AddDeleteEvent {
  BuildContext context;
  DeleteOrderEvent(this.context);
}
