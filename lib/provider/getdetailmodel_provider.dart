import 'package:flutter/cupertino.dart';
import 'package:uts_mobile/model/detail_model.dart';
import 'package:uts_mobile/service/api_service.dart';

class GetdetailmodelProvider extends ChangeNotifier {
  bool _onProgress = false;
  bool getOnProgress() => _onProgress;

  Future<DetailModel> getDetailModel(String imdbID, String apikey) async {
    _onProgress = true;
    notifyListeners();

    DetailModel result = await ApiService.get_detailbyid(imdbID, apikey);

    _onProgress = false;
    notifyListeners();
    return result;
  }
}
