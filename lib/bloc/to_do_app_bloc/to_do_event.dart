import 'package:equatable/equatable.dart';
import 'package:blocapp/models/to_do_model.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class AddToDo extends ToDoEvent {
  final ToDoModel toDoData;

  const AddToDo({required this.toDoData});

  @override
  List<Object> get props => [toDoData];
}

class RemoveToDo extends ToDoEvent {
  final int index;

  const RemoveToDo({required this.index});

  @override
  List<Object> get props => [index];
}

class AddToFav extends ToDoEvent {
  final int index;

  const AddToFav({required this.index});

  @override
  List<Object> get props => [index];
}
