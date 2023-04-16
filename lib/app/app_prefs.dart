import 'package:flu_proj/presentation/resourses/langauge_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN_VIEWWD =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWWD";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLangauge() async {
    String? langauge = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (langauge != null && langauge.isNotEmpty) {
      return langauge;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLangauge();
    if (currentLang == LanguageType.ARAIC.getValue()) {
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARAIC.getValue());
    }
  }
  Future<Locale> getLocal() async {
    String currentLang = await getAppLangauge();
    if (currentLang == LanguageType.ARAIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
     return ENGLISH_LOCAL;
    }
  }

  ///on boarding

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWWD, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWWD) ??
        false;
  }

  //login screen

  Future<void> setLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }
}
