import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: source,
    );
    return image;
  }
}
