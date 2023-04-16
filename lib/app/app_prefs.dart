import 'package:flu_proj/presentation/resourses/langauge_manager.dart';
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
      return LangaugeType.ENGLISH.getValue();
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
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ??
        false;
  }

Future<void>logout()async{
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
}










}
