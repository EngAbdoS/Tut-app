import 'package:flu_proj/presentation/resourses/langauge_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

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
}
