import 'package:core_services/core_services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/material.dart';
import 'package:lists_joao_nogueira/list_app_routes.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../../global_instance.dart';
import '../../../../utils/mixins/messages.dart';
import '../../../../utils/theme/theme_app.dart';
import '../stores/login_store.dart';
import '../widgets/forgot_login_info_widget.dart';
import '../widgets/login_button.dart';
import '../widgets/text_form_field_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Messages {
  late LoginStore store;
  late FocusNode passwordFocus;
  @override
  void initState() {
    super.initState();
    passwordFocus = FocusNode();
    store = sl<LoginStore>();
  }

  @override
  void dispose() {
    passwordFocus.dispose();
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Form(
                  key: store.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/splash.png",
                          filterQuality: FilterQuality.high,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormFieldLogin(
                          controller: store.emailEC,
                          nextFocus: passwordFocus,
                          label: Tr.of(
                            context,
                            "list.login.user",
                          ),
                          textInputType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: Validatorless.multiple([
                            Validatorless.required(
                              Tr.of(
                                context,
                                "list.login.user_empty",
                              ),
                            ),
                            Validatorless.email(
                              Tr.of(
                                context,
                                "list.login.user_invalid",
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Observer(builder: (context) {
                          return TextFormFieldLogin(
                            controller: store.passwordEC,
                            showPassword: store.togglePasswordVisibility,
                            focusNode: passwordFocus,
                            label: Tr.of(
                              context,
                              "list.login.password",
                            ),
                            obscureText: !store.isPasswordVisible,
                            validator: Validatorless.required(
                              Tr.of(
                                context,
                                "list.login.password_required",
                              ),
                            ),
                            onSubmit: () async {
                              if (store.isValid) {
                                final bool result = await store.login();
                                if (result) {
                                  NavigationService().pushReplacementNamed(
                                      ListAppRoutes.studentList);
                                } else {
                                  showError(store.error);
                                }
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            ForgotLoginInfoWidget(
                              text: Tr.of(
                                context,
                                "list.login.forgot_password",
                              ),
                              onTap: () {
                                showInfo(
                                  Tr.of(
                                    context,
                                    "list.login.under_development",
                                  ),
                                );
                              },
                            ),
                            Text(
                              Tr.of(
                                context,
                                "list.login.or",
                              ),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            ForgotLoginInfoWidget(
                              text: Tr.of(
                                context,
                                "list.login.forgot_user",
                              ),
                              onTap: () {
                                showInfo(
                                  Tr.of(
                                    context,
                                    "list.login.under_development",
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Observer(builder: (context) {
                          if (store.loginState == LoginStates.loading) {
                            return const CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CircularProgressIndicator.adaptive(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                              ),
                            );
                          }
                          return Column(
                            children: [
                              LoginButton(
                                backgroundColor: theme.primaryColor,
                                textColor: Colors.white,
                                text: Tr.of(
                                  context,
                                  "list.login.login",
                                ),
                                onPressed: () async {
                                  if (store.isValid) {
                                    final bool result = await store.login();
                                    if (result) {
                                      NavigationService().pushReplacementNamed(
                                          ListAppRoutes.studentList);
                                    } else {
                                      showError(store.error);
                                    }
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              LoginButton(
                                textColor: theme.primaryColor,
                                borderColor: theme.primaryColor,
                                text: Tr.of(
                                  context,
                                  "list.login.register",
                                ),
                                onPressed: () async {
                                  if (store.isValid) {
                                    final bool result = await store.register();
                                    if (result) {
                                      showSuccess(
                                        Tr.of(
                                          context,
                                          "list.login.register_success",
                                        ),
                                      );
                                    } else {
                                      showError(store.error);
                                    }
                                  }
                                },
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
