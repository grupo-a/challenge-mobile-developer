import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../../global_instance.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/usecases/get_login_use_case.dart';
import '../../domain/usecases/load_user_use_case.dart';
import '../../domain/usecases/post_user_use_case.dart';
import '../../domain/usecases/save_user_use_case.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/login_model.dart';

part 'login_store.g.dart';

enum LoginStates { initial, loading, success, failure }

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  late final GetLoginUseCase getLoginUseCase;
  late final LoadUserUseCase loadUserUseCase;
  late final PostUserUseCase postUserUseCase;
  late final SaveUserUseCase saveUserUseCase;

  LoginStoreBase()
      : getLoginUseCase = sl.get<GetLoginUseCase>(),
        loadUserUseCase = sl.get<LoadUserUseCase>(),
        postUserUseCase = sl.get<PostUserUseCase>(),
        saveUserUseCase = sl.get<SaveUserUseCase>();

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

  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
  }

  bool get isValid => formKey.currentState!.validate();

  @action
  Future<bool> login() async {
    bool result = false;
    loginState = LoginStates.loading;
    var currentUser = await _loadUser();
    var user = await _fetchUser();
    if (currentUser != null && user?.id == currentUser) {
      loginState = LoginStates.success;
      result = true;
    } else {
      if (user != null) {
        await saveUserUseCase.call(user);
        loginState = LoginStates.success;
        result = true;
      }
    }
    return result;
  }

  @action
  Future<bool> register() async {
    bool result = false;
    var user = await postUserUseCase.call(LoginModel(
      email: emailEC.text,
      password: passwordEC.text,
    ));
    user.fold((success) async {
      loginState = LoginStates.initial;
      result = true;
    }, (error) {
      loginState = LoginStates.failure;
      this.error = error.toString();
      log('Register error', error: error);
      result = false;
    });
    return result;
  }

  Future<String?> _loadUser() async {
    String? userId;
    var isLogged = await loadUserUseCase.execute();
    isLogged.fold((success) {
      userId = success;
    }, (error) {
      this.error = error.toString();
      log('Load user error', error: error);
    });
    return userId;
  }

  Future<LoginEntity?> _fetchUser() async {
    LoginEntity? user;
    var response = await getLoginUseCase.call(LoginModel(
      email: emailEC.text,
      password: passwordEC.text,
    ));
    response.fold((success) async {
      if (success.id == null) {
        loginState = LoginStates.failure;
        error = 'User not found';
      } else {
        user = success;
      }
    }, (error) {
      loginState = LoginStates.failure;
      this.error = error.toString();
      log('Login error', error: error);
    });
    return user;
  }
}
