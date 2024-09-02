import 'package:blocapp/bloc/to_do_app_bloc/to_do_event.dart';
import 'package:blocapp/models/to_do_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocapp/bloc/to_do_app_bloc/to_do_bloc.dart';
import 'package:blocapp/bloc/to_do_app_bloc/to_do_state.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller is declared outside the build method, so it doesn't get reset on rebuild
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          BlocBuilder<ToDoBloc, ToDoState>(
            builder: (context, state) {
              if (state.toDoList.isEmpty) {
                return const Center(child: Text("No to-dos available."));
              }
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 80), // Adjust for text field
                itemCount: state.toDoList.length,
                itemBuilder: (context, index) {
                  final toDo = state.toDoList[index];
                  return ListTile(
                    title: Text(toDo.title),
                    subtitle: Text('${toDo.date.toLocal()}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(toDo.isFav == true
                              ? Icons.favorite
                              : Icons.favorite_border), // Use appropriate icon
                          onPressed: () {
                            context
                                .read<ToDoBloc>()
                                .add(AddToFav(index: index));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.clear), // Delete button
                          onPressed: () {
                            // Trigger the RemoveToDo event
                            context
                                .read<ToDoBloc>()
                                .add(RemoveToDo(index: index));
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: "Enter To-Do",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        context.read<ToDoBloc>().add(
                          AddToDo(
                            toDoData: ToDoModel(
                              title: textController.text,
                              date: DateTime.now(),
                            ),
                          ),
                        );
                        textController.clear(); // Clear the input field after sending
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
