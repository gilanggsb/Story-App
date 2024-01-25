import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import '../../home_screen/controllers/controllers.dart';
import '../data/data.dart';
import '../../../common/common.dart';

class AddStoryProvider extends ChangeNotifier {
  String? imagePath;
  XFile? imageFile;
  final MyRouterDelegate _myRouter = MyRouterDelegate.instance;
  final AddStoryRepository _repository = AddStoryRepository();
  final HomeProvider _homeProvider = HomeProvider.instance;

  void setImagePath(String? value) {
    imagePath = value;
    notifyListeners();
  }

  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }

  Future<XFile?> imagePicker(ImageSource source) async {
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    final isiOS = defaultTargetPlatform == TargetPlatform.iOS;
    final isNotMobile = !(isAndroid || isiOS);
    if (isNotMobile) return null;
    final ImagePicker picker = ImagePicker();

    return await picker.pickImage(
      source: source,
    );
  }

  void openGallery() async {
    final XFile? pickedFile = await imagePicker(ImageSource.gallery);

    if (pickedFile == null) {
      return;
    }

    setImageFile(pickedFile);
    setImagePath(pickedFile.path);
  }

  void openCamera() async {
    final XFile? pickedFile = await imagePicker(ImageSource.camera);

    if (pickedFile == null) {
      return;
    }

    setImageFile(pickedFile);
    setImagePath(pickedFile.path);
  }

  void postStory(String description) async {
    try {
      if (description.isEmpty) {
        return _myRouter.showSnackbar('Description must not be empty');
      }

      if (imageFile == null) {
        return _myRouter.showSnackbar('Image must not be empty');
      }

      showLoading();
      final data = UploadStory(description: description, file: imageFile!);
      await _repository.postStory(data);

      _myRouter.showSnackbar('Upload Story Success');
      _homeProvider.getStories();
      _myRouter.popRoute();
    } on String catch (e) {
      _myRouter.showSnackbar(e);
    } catch (e) {
      _myRouter.showSnackbar('Something went wrong $e');
    } finally {
      dismissLoading();
    }
  }
}
