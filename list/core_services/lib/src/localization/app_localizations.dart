import 'package:flutter/material.dart';

import 'app_localizations_delegate.dart';
import 'nested_json_parser.dart';

class AppLocalizations {
  static AppLocalizationsDelegate delegate(
          Map<String, Map<String, dynamic>> localizedValues) =>
      AppLocalizationsDelegate(localizedValues);

  AppLocalizations(this.locale, this.localizedValues);

  final Map<String, Map<String, dynamic>> localizedValues;
  final Locale locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String trans(
    String? key, {
    Map<String, String>? params,
    String? defaultValue,
  }) {
    if (key == null) throw ArgumentError('key is null');

    var languageCode = locale.languageCode;
    String? localizedValue;

    if (localizedValues[languageCode] == null) {
      return "$languageCode not found";
    }

    localizedValue = NestedJsonParser.resolve<String>(
      json: localizedValues[languageCode]!,
      path: key,
      defaultValue: defaultValue ?? "",
    );

    if (localizedValue == null || localizedValue.isEmpty) {
      return 'key: $key not found';
    }

    if (params != null) {
      params.forEach((key, value) {
        localizedValue = localizedValue!.replaceAll('{{$key}}', value);
      });
    }

    return localizedValue ?? key;
  }
}
