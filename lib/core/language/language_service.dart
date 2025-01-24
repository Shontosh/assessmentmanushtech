import 'package:assesmentmanushtech/core/injection/injection_container.dart';
import 'package:assesmentmanushtech/core/language/app_language.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LanguageService {
  final String _boxName = 'langBox';




  Language getContextLocale(BuildContext context) {
    for (Language language in Language.values) {
      if (context.locale == language.locale) {
        return language;
      }
    }
    return Language.english; // Default to English if no match is found
  }
}
