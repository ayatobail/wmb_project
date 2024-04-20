import '../network_config.dart';

class ArtistsEndpoints {
  static String addArtist = NetworkConfig.getFullApiRoute('artists');
  static String getAllArtists = NetworkConfig.getFullApiRoute('artists');
  static String searchArtists = NetworkConfig.getFullApiRoute('artists/search');
  static String getSongs = NetworkConfig.getFullApiRoute('artists/search');
}