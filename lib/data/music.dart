class MusicList {
  final int id;
  final String title;
  final String artist;
  final String musicurl;
  final String imgurl;

  const MusicList({
    required this.id,
    required this.title,
    required this.artist,
    required this.musicurl,
    required this.imgurl,
  });

  factory MusicList.fromJson(Map<String, dynamic> json) {
    return MusicList(
      id: json["id"],
      title: json["foreign_title"],
      artist: json["artist_name"],
      musicurl: json["filename"],
      imgurl: json["image_filename"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "foreign_title": title,
      "artist_name": artist,
      "filename": musicurl,
      "image_sfilename": imgurl,
    };
  }
}
