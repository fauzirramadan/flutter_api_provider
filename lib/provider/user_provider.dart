import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_provider/models/user.dart';
import 'package:flutter_api_provider/repository/general_repo.dart';
import 'package:flutter_api_provider/response/res_get_user.dart';
import 'package:flutter_api_provider/utils/notification_utils.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    init();
  }

  bool isLoading = false;
  List<User> dataUser = [];
  final GeneralRepo _repo = GeneralRepo();

  void init() async {
    getDaftarUser();
  }

  Future<void> getDaftarUser({String? page}) async {
    try {
      isLoading = true;
      notifyListeners();

      ResListUser? res = await _repo.getUser(page: page);
      if (res?.data != null) {
        dataUser = res?.data ?? [];
        isLoading = false;
        notifyListeners();
        log("data user : $dataUser");
      } else {
        isLoading = false;
        notifyListeners();
        log("error");
        NotifUtils.showSnackbar("GAGAL FETCH DATA", bgColor: Colors.red);
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      log("$e");
      NotifUtils.showSnackbar("$e", bgColor: Colors.red);
    }
  }
}
