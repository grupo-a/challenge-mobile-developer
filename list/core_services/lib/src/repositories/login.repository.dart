import 'dart:convert';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import '../models/login_response.dart';
import '../models/response.model.dart';

class LoginRepository {
  final EncryptedSharedPreferences _esp = EncryptedSharedPreferences();
  final _loginKey = "login";
  final _lembrarMeKey = "lembrarMe";

  Future<CoreResponse> save(LoginResponse dadosLogin, bool lembrarMe) async {
    var response = CoreResponse();

    var salvarSharedPrefer =
        await _esp.setString(_loginKey, jsonEncode(dadosLogin.toJson()));

    if (!salvarSharedPrefer) {
      response.fail("Erro ao salvar dados de login.");
      return response;
    }

    var salvarLembrar =
        await _esp.setString(_lembrarMeKey, lembrarMe.toString());

    if (!salvarLembrar) {
      response.fail("Erro ao salvar dados de login.");
    }

    return response;
  }

  Future<CoreResponse<LoginResponse>> get() async {
    var response = CoreResponse<LoginResponse>();
    var dadosLogin = await _esp.getString(_loginKey);

    if (dadosLogin.isEmpty) {
      response.fail("Falha ao obter dados de login.");
      return response;
    }

    response.data = LoginResponse.fromJson(jsonDecode(dadosLogin));
    return response;
  }

  Future<bool> getLembrar() async {
    var lembrar = await _esp.getString(_lembrarMeKey);

    return lembrar.isNotEmpty && lembrar.toLowerCase() == "true";
  }

  Future<bool> clean() async {
    var removerLembrar = await _esp.remove(_lembrarMeKey);
    var removerLogin = await _esp.remove(_loginKey);
    return removerLogin && removerLembrar;
  }
}
