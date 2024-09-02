import 'package:blocapp/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'image_picker_event.dart';
import 'image_picker_state.dart';

class PickImageBloc extends Bloc<PickImageEvent, PickImageState> {
  final ImagePickerUtils imagePickerUtils;

  PickImageBloc(this.imagePickerUtils) : super(const PickImageState()) {
    on<PickImage>(_pickImage);
  }

  Future<void> _pickImage(PickImage event, Emitter<PickImageState> emit) async {
    try {
      final BuildContext context = event.context; // Get context from event
      emit(state.copyWith(isLoading: true));
      final XFile? file = await imagePickerUtils.showImageSourceBottomSheet(context);
      emit(state.copyWith(selectedImage: file, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
