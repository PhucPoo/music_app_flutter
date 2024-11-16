import 'package:music_app/data/model/song.dart';
import 'package:music_app/data/source/source.dart';

abstract interface class Repository {
  Future<List<Song>?> loadData();
}

class DefaultRepository implements Repository {
  final _localDataSource = LocalDataSource();
  final _remoteDataSource = RemoteDataSource();

  @override
  Future<List<Song>?> loadData() async {
    List<Song> songs = [];

    // Thử tải dữ liệu từ nguồn từ xa
    final remoteSongs = await _remoteDataSource.loadData();

    if (remoteSongs == null) {
      // Nếu không có dữ liệu từ xa, tải dữ liệu từ nguồn cục bộ
      final localSongs = await _localDataSource.loadData();
      if (localSongs != null) {
        songs.addAll(localSongs);
      }
    } else {
      songs.addAll(remoteSongs);
    }

    return songs;
  }
}
