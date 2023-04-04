part of 'add_delete_bloc.dart';

@immutable
abstract class AddDeleteState {}

class AddDeleteInitial extends AddDeleteState {}

class OrderAddingState extends AddDeleteState {
  @override
  List<Object?> get props => [];
}

class OrderAddedState extends AddDeleteState {
  @override
  List<Object?> get props => [];
}

class OrderDeletedState extends AddDeleteState {
  OrderDeletedState();
  @override
  List<Object?> get props => [];
}