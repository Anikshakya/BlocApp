import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage(ImageSource source) async {
    return await _picker.pickImage(source: source);
  }

  Future<XFile?> showImageSourceBottomSheet(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return showModalBottomSheet<XFile?>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[900] : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(
                color: isDarkMode ? Colors.black.withOpacity(0.5) : Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildImageSourceTile(
                context: context,
                icon: Icons.camera,
                title: 'Capture from Camera',
                source: ImageSource.camera,
              ),
              _buildImageSourceTile(
                context: context,
                icon: Icons.photo_library_rounded,
                title: 'Select from Gallery',
                source: ImageSource.gallery,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageSourceTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required ImageSource source,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Add padding here
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            Navigator.of(context).pop(await pickImage(source));
          },
          borderRadius: BorderRadius.circular(16.0), // Set the curved border radius
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CircleAvatar(
                backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                child: Icon(icon, color: isDarkMode ? Colors.white : Colors.black, size: 18),
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
