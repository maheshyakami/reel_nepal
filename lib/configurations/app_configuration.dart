class AppConfiguration {
  static const API_BASE_URL = "https://api.reelnepal.com/api/";
  static const API_MOVIEBASE_URL =
      "https://content.reelnepal.com/photos/movieposters/original/";
  static const API_NEWSBASE_URL = "https://content.reelnepal.com/images/";
  static String videoToThumbnail(String videoId) =>
      ("https://img.youtube.com/vi/$videoId/sddefault.jpg");
  static String crewImgThumbnail(String profilePhoto) =>
      ("https://content.reelnepal.com/photos/crewstanphotos/im214x317/214x317$profilePhoto");
  static String movieImgThumbnail(String coverPhoto) =>
      ("https://content.reelnepal.com/photos/movieposters/im214x317/214x317$coverPhoto");
}
