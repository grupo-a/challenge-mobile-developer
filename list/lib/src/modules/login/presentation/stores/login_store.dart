import 'dart:developer';
import 'package:core_services/core_services.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

enum LoginStates { initial, loading, success, failure }

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final CoreStorageInterface _coreStorage;
  LoginStoreBase({
    required CoreStorageInterface coreStorage,
  }) : _coreStorage = coreStorage;

  @observable
  LoginStates loginState = LoginStates.initial;

  @observable
  bool isPasswordVisible = false;

  @action
  void togglePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  String error = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailEC = TextEditingController(text: '');
  final passwordEC = TextEditingController(text: '');

  bool get isValid => formKey.currentState!.validate();

  @action
  Future<bool> login() async {
    try {
      loginState = LoginStates.loading;
      // final LegacyAuthModel auth =
      //     await _authRepository.auth(emailEC.text, passwordEC.text, '1');
      // await _coreStorage.saveToken(auth.token!);
      loginState = LoginStates.success;

      return true;
    } catch (e, s) {
      loginState = LoginStates.failure;
      error =
          'Você digitou a senha e/ou email incorretamente. Tente novamente.';
      log('Falha ao realizar login', error: e, stackTrace: s);
      return false;
    }
  }
}
