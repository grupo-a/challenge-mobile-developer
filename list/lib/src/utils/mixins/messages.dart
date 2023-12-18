import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../theme/theme_app.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  showError(String message) {
    showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: message,
          backgroundColor: Colors.red,
          icon: const SizedBox(),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  showInfo(String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: message,
        backgroundColor: theme.primaryColor,
        icon: const SizedBox(),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  showSuccess(String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: message,
        backgroundColor: Colors.green,
        icon: const SizedBox(),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
