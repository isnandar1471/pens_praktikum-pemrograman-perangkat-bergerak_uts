import 'package:flutter/cupertino.dart';

class ApikeyProvider extends ChangeNotifier {
  bool _haveApikey = false;
  String _apikey = '';

  bool isHaveApikey() {
    return _haveApikey;
  }

  void setApikey(String apikey) {
    _apikey = apikey;
    _haveApikey = true;

    notifyListeners();
  }

  String getApikey() {
    return _apikey;
  }
}
