import 'package:image_picker/image_picker.dart';

class UploadStory {
  final XFile file;
  final String description;
  final double? lat;
  final double? lon;

  UploadStory({
    required this.file,
    required this.description,
    this.lat,
    this.lon,
  });

  Map<String, dynamic> toJson() => {
        "description": description,
        "lat": lat ?? 0,
        "lon": lon ?? 0,
      };
}
