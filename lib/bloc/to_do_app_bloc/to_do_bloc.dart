import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocapp/bloc/to_do_app_bloc/to_do_event.dart';
import 'package:blocapp/bloc/to_do_app_bloc/to_do_state.dart';
import 'package:blocapp/models/to_do_model.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(const ToDoState()) {
    on<AddToDo>(_addToDo);
    on<RemoveToDo>(_removeToDo);
    on<AddToFav>(_addToFav);
  }

  void _addToDo(AddToDo event, Emitter<ToDoState> emit) {
    final List<ToDoModel> updatedToDos = List.from(state.toDoList)..add(event.toDoData);
    emit(state.copyWith(todos: updatedToDos));
  }

  void _removeToDo(RemoveToDo event, Emitter<ToDoState> emit) {
    final List<ToDoModel> updatedToDos = List.from(state.toDoList)..removeAt(event.index);
    emit(state.copyWith(todos: updatedToDos));
  }

  void _addToFav(AddToFav event, Emitter<ToDoState> emit) {
    // Create a copy of the current list
    final List<ToDoModel> updatedToDos = List.from(state.toDoList);
    
    // Get the specific ToDoModel at the index
    final ToDoModel updatedToDo = updatedToDos[event.index];

    // Create a new ToDoModel with the updated isFav value
    final ToDoModel updatedModel = ToDoModel(
      title: updatedToDo.title,
      date: updatedToDo.date,
      isFav: updatedToDo.isFav == false ? true : false, // Update the isFav value to true
    );

    // Replace the old ToDoModel with the updated one
    updatedToDos[event.index] = updatedModel;

    // Emit the updated state with the new list
    emit(state.copyWith(todos: updatedToDos));
  }

  // void _addToFav(AddToFav event, Emitter<ToDoState> emit) {
  //   final List<ToDoModel> updatedToDos = List.from(state.toDoList);
  //   final ToDoModel updatedToDo = updatedToDos[event.index].copyWith(isFav: !updatedToDos[event.index].isFav);
  //   updatedToDos[event.index] = updatedToDo;
  //   emit(state.copyWith(todos: updatedToDos)); // Make sure to use toDoList here
  // }


}
