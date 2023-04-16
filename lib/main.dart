import 'package:easy_localization/easy_localization.dart';
import 'package:flu_proj/app/di.dart';
import 'package:flu_proj/presentation/resourses/langauge_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATION,
      child: Phoenix(child: MyApp())));
}
