import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '/model/errorresponse_model.dart';
import '/constant/app_constant.dart';
import '/model/detail_model.dart';
import '/model/search_model.dart';

class ApiService {
  /// return instance of DetailModel or ErrorresponseModel
  static Future<dynamic> get_detailbyid(String id, String apikey) async {
    var response =
        await http.get(Uri.parse(AppConstant.detailbyidUrl(id, apikey)));

    if (response.statusCode != 200) {
      throw Exception('Error with statusCode ${response.statusCode}');
    }

    try {
      return DetailModel.fromJson(json.decode(response.body));
    } catch (e) {
      return ErrorresponseModel.fromJson(json.decode(response.body));
    }
  }

  /// return instance of SearchModel or ErrorresponseModel
  static Future<dynamic> get_search(String search, String apikey) async {
    var response =
        await http.get(Uri.parse(AppConstant.searchUrl(search, apikey)));
    inspect(response);
    if (response.statusCode != 200) {
      throw Exception('Error with statusCode ${response.statusCode}');
    }

    try {
      return SearchModel.fromJson(json.decode(response.body));
    } catch (e) {
      return ErrorresponseModel.fromJson(json.decode(response.body));
    }
  }
}
