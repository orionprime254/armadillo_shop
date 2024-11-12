import 'dart:convert';

import 'package:armadillo_shop/common/services/storage.dart';
import 'package:armadillo_shop/common/utils/environment.dart';
import 'package:armadillo_shop/common/widgets/error_modal.dart';
import 'package:armadillo_shop/src/auth/model/auth_token_model.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../../common/utils/kstrings.dart';

class AuthNotifier with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => false;

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void loginFunc(String data, BuildContext ctx) async {
    setLoading();
    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/token/login');
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'}, body: data);
      if (response.statusCode == 200) {
        String accessToken = accessTokenModelFromJson(response.body).authToken;
        Storage().setString('accessToken', accessToken);
        print(accessToken);
        //get user info

        //get user extraas

        setLoading();
        ctx.go('/home');
      //  print('login success');
      }
    } catch (e) {
      setLoading();
      showErrorPopup(ctx, AppText.kErrorLogin, null, null);
    }
  }

  void registrationFunc(String data, BuildContext ctx) async {
    setLoading();
    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/users/');
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'}, body: data);
      if (response.statusCode == 201) {
        setLoading();
      } else if (response.statusCode == 400) {
        setLoading();
        var data = jsonDecode(response.body);
        showErrorPopup(ctx, data['passowrd'][0], null, null);
      }
    } catch (e) {
      setLoading();
      showErrorPopup(ctx, AppText.kErrorLogin, null, null);
    }
  }

  void getUser(String accessToken) async {
    
  }
}
