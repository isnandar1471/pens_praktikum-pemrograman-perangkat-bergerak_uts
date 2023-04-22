class AppConstant {
  static const baseUrl = 'https://www.omdbapi.com/';
  static const apiKey = '27e18332';
  static const imagenotfoundPath = 'asset/image/image-not-found.jpg';

  static String detailbyidUrl(String id) {
    return '${AppConstant.baseUrl}?apiKey=${AppConstant.apiKey}&i=${id}';
  }

  static String searchUrl(String search) {
    return '${AppConstant.baseUrl}?apiKey=${AppConstant.apiKey}&s=${search}';
  }
}
