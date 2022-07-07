import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: source);
    // print(image?.path);
    return image;
  }
}
