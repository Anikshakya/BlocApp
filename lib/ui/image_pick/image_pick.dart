import 'dart:io';
import 'package:blocapp/ui/to_do_app/to_do_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:blocapp/bloc/image_pick_bloc/image_picker_bloc.dart';
import 'package:blocapp/bloc/image_pick_bloc/image_picker_event.dart';
import 'package:blocapp/bloc/image_pick_bloc/image_picker_state.dart';
import 'package:blocapp/utils/image_picker_utils.dart';

class ImagePick extends StatelessWidget {
  const ImagePick({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker with BLoC"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: BlocProvider(
          create: (context) => PickImageBloc(ImagePickerUtils()),
          child: BlocConsumer<PickImageBloc, PickImageState>(
            listener: (context, state) {
              if (state.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error!)),
                );
              }
            },
            builder: (context, state) {
              XFile? imageFile = state.selectedImage;

              return Column(
                children: [
                  // Image
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: imageFile != null
                        ? Image.file(File(imageFile.path))
                        : const Center(child: Text('No image selected')),
                  ),
                  const SizedBox(height: 40),
                  // Pick Image Button
                  ElevatedButton(
                    onPressed: () {
                      context.read<PickImageBloc>().add(PickImage(context));
                    },
                    child: const Text("Pick An Image"),
                  ),
                  const SizedBox(height: 60),
                  // To Do App
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ToDoApp(),));
                    }, 
                    child: const Text("To Do App")
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
