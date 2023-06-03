class AppConstant {
  static const baseUrl = 'https://www.omdbapi.com/';
  static const imagenotfoundPath = 'asset/image/image-not-found.jpg';

  static String detailbyidUrl(String id, String apikey) {
    print('${AppConstant.baseUrl}?apiKey=$apikey&i=$id');
    return '${AppConstant.baseUrl}?apiKey=$apikey&i=$id';
  }

  static String searchUrl(String search, String apikey) {
    print('${AppConstant.baseUrl}?apiKey=$apikey&s=$search');
    return '${AppConstant.baseUrl}?apiKey=$apikey&s=$search';
  }
}
