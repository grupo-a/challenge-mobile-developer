import 'package:flutter/material.dart';

import 'app_localizations.dart';

typedef CallTranslate = String Function(String key);

class Tr {
  static String of(
    BuildContext context,
    String key, {
    Map<String, String>? params,
    String? defaultValue,
  }) {
    return AppLocalizations.of(
      context,
    )!
        .trans(key, params: params, defaultValue: defaultValue);
  }
}
