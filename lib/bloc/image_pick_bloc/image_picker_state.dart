import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class PickImageState extends Equatable {
  final XFile? selectedImage;
  final String? error;

  const PickImageState({
    this.selectedImage,
    this.error,
  });

  PickImageState copyWith({
    XFile? selectedImage,
    bool? isLoading,
    String? error,
  }) {
    return PickImageState(
      selectedImage: selectedImage ?? this.selectedImage,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [selectedImage, error];
}
