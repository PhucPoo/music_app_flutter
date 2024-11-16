class Song {
  Song({
    required this.id,
    required this.title,
    required this.album,
    required this.artist,
    required this.duration,
    required this.image,
    required this.source,
  });

  factory Song.fromJson(Map<String, dynamic> map) {
    return Song(
      id: map['id'],
      title: map['title'],
      album: map['album'],
      artist: map['artist'],
      duration: map['duration'],
      image: map['image'],
      source: map['source'],
    );
  }

  String id;
  String title;
  String album;
  String artist;
  String source;
  String image;
  int duration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Song && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Song{id: $id, title: $title, album: $album, artist: $artist, source: $source, image: $image, duration: $duration}';
  }
}
