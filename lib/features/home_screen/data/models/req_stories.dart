class ReqStories {
  final int? page;
  final int? size;
  final bool? location;

  const ReqStories({this.page, this.size, this.location});

  factory ReqStories.fromJson(Map<String, dynamic> json) => ReqStories(
        page: json["page"],
        size: json["size"],
        location: json["location"],
      );

  int parseLocationToNumber(bool? location) {
    if (location == null || !location) {
      return 0;
    }

    return 1;
  }

  Map<String, dynamic> toJson() => {
        "page": page,
        "size": size,
        "location": parseLocationToNumber(location),
      };
}
