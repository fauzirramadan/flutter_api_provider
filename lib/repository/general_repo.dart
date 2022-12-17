import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_api_provider/response/res_get_user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class GeneralRepo {
  Future<ResListUser?> getUser({String? page}) async {
    try {
      var url = Uri.https("reqres.in", "/api/users", {"page": page});
      Response res = await http.get(url);
      return resListUserFromJson(res.body);
    } catch (e, st) {
      if (kDebugMode) {
        log(st.toString());
      }
      log(e.toString());
    }
    return null;
  }
}
