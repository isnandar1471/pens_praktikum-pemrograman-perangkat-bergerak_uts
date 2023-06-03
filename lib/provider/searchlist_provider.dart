import 'package:flutter/cupertino.dart';
import 'package:uts_mobile/service/api_service.dart';
import '/model/search_model.dart';

class SearchlistProvider extends ChangeNotifier {
  List<Search> _searchlist = [];
  bool _onProgress = false;

  List<Search> getSearchlist() => _searchlist;

  bool getOnProgress() => _onProgress;

  void setSearchlist(List<Search> searchlist) {
    _searchlist = searchlist;
    notifyListeners();
  }

  void doSearch(String text, String apikey) async {
    _onProgress = true;
    notifyListeners();

    var result = await ApiService.get_search(text, apikey);

    if (result is SearchModel) {
      setSearchlist(result.search);
    }

    _onProgress = false;
    notifyListeners();
  }
}
