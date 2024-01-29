import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
import 'package:image/image.dart' as img;
import '../../../../common/common.dart';
import '../models/upload_story.dart';

class AddStoryRepository {
  final ApiService _apiService = ApiService.instance;

  Future<bool> postStory(UploadStory uploadStory) async {
    try {
      String fileName = uploadStory.file.path.split('/').last;

      final fileBytes =
          await compressImage(await uploadStory.file.readAsBytes());

      Map<String, dynamic> data = {
        "description": uploadStory.description,
        "lat": uploadStory.lat,
        "lon": uploadStory.lon,
      };

      final UploadFormDataModel formData = UploadFormDataModel(
        fileBytes: fileBytes,
        data: data,
        contentType: MediaType("image", "jpeg"),
        fileKey: 'photo',
        fileName: fileName,
      );

      await _apiService.formData(
        URL.storiesUrl,
        formData,
      );

      return true;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }

  Future<List<int>> compressImage(Uint8List bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;
    final img.Image image = img.decodeImage(bytes)!;
    int compressQuality = 100;
    int length = imageLength;
    List<int> newByte = [];
    do {
      ///
      compressQuality -= 10;
      newByte = img.encodeJpg(
        image,
        quality: compressQuality,
      );
      length = newByte.length;
    } while (length > 1000000);
    return newByte;
  }
}
