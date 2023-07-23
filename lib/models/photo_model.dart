class PhotoModel {
  int id;
  String photoUrl;

  PhotoModel({
    required this.id,
    required this.photoUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      photoUrl: json['url'],
    );
  }
}
