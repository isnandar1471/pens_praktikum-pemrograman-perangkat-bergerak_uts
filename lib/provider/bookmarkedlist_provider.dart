import 'package:flutter/cupertino.dart';
import '/model/search_model.dart';

class BookmarkedlistProvider extends ChangeNotifier {
  List<Search> _bookmarkedlist = [];

  List<Search> getBookmarkedlist() => _bookmarkedlist;

  void addItem(Search item) {
    _bookmarkedlist.add(item);

    notifyListeners();
  }

  void removeItem(Search item) {
    _bookmarkedlist
        .removeWhere((Search element) => element.imdbId == item.imdbId);

    notifyListeners();
  }

  bool haveItem(Search item) {
    List listFindedItem = _bookmarkedlist
        .where((Search element) => element.imdbId == item.imdbId)
        .toList();
    return listFindedItem.isEmpty ? false : true;
  }
}
