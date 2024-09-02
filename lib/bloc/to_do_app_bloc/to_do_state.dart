import 'package:blocapp/models/to_do_model.dart';
import 'package:equatable/equatable.dart';

class ToDoState extends Equatable {
  final List<ToDoModel> toDoList;
  const ToDoState({this.toDoList = const <ToDoModel>[]});

  ToDoState copyWith({List<ToDoModel>? todos}){
    return ToDoState(toDoList: todos ?? toDoList);
  }
  
  @override
  List<Object> get props => [toDoList];
}
