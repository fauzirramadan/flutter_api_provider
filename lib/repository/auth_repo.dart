import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_api_provider/repository/api.dart';
import 'package:flutter_api_provider/response/res_login.dart';
import 'package:flutter_api_provider/response/res_register.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthRepo {
  Future<ResLogin?> userLogin(String email, String password) async {
    try {
      Response res = await http.post(Uri.parse(Api.loginUrl),
          body: {"email": email, "password": password});
      return resLoginFromJson(res.body);
    } catch (e, st) {
      if (kDebugMode) {
        log(st.toString());
      }
      log("error repo: $e");
    }
    return null;
  }

  Future<ResRegister?> userRegister(String email, String password) async {
    try {
      Response res = await http.post(Uri.parse(Api.regUrl),
          body: {"email": email, "password": password});
      return resRegisterFromJson(res.body);
    } catch (e, st) {
      if (kDebugMode) {
        log(st.toString());
      }
      log("error repo: $e");
    }
    return null;
  }
}
