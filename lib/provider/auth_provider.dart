import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_provider/repository/auth_repo.dart';
import 'package:flutter_api_provider/response/res_login.dart';
import 'package:flutter_api_provider/response/res_register.dart';
import 'package:flutter_api_provider/utils/nav_helper.dart';
import 'package:flutter_api_provider/utils/notification_utils.dart';
import 'package:flutter_api_provider/views/home.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  final AuthRepo _repo = AuthRepo();
  ResLogin? dataLogin;
  ResRegister? dataRegister;

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();
      ResLogin? res = await _repo.userLogin(email, password);
      if (res?.token != null) {
        dataLogin = res;
        isLoading = false;
        notifyListeners();
        log("token ${dataLogin?.token}");
        NotifUtils.showSnackbar("BERHASIL LOGIN", bgColor: Colors.green);
        Nav.toAll(const HomePage());
      } else {
        log(res!.token.toString());
        isLoading = false;
        notifyListeners();
        NotifUtils.showSnackbar("GAGAL LOGIN", bgColor: Colors.red);
      }
    } catch (e) {
      log("error provider : $e");
      isLoading = false;
      notifyListeners();
      NotifUtils.showSnackbar(e.toString(), bgColor: Colors.red);
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();
      ResRegister? res = await _repo.userRegister(email, password);
      if (res?.token != null) {
        dataRegister = res;
        isLoading = false;
        notifyListeners();
        log("token ${dataRegister?.token}");
        NotifUtils.showSnackbar("BERHASIL REGISTER, SILAHKAN LOGIN",
            bgColor: Colors.green);
      } else {
        log(res!.token.toString());
        isLoading = false;
        notifyListeners();
        NotifUtils.showSnackbar("GAGAL REGISTER", bgColor: Colors.red);
      }
    } catch (e) {
      log("error provider : $e");
      isLoading = false;
      notifyListeners();
      NotifUtils.showSnackbar(e.toString(), bgColor: Colors.red);
    }
  }
}
