import '../network_config.dart';

class SongsEndpoints {
  static String sddSong = NetworkConfig.getFullApiRoute('songs');
  static String getAllSongs = NetworkConfig.getFullApiRoute('songs');
  static String searchSong = NetworkConfig.getFullApiRoute('songs/search');
}