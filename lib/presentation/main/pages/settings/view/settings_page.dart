import 'package:flu_proj/app/app_prefs.dart';
import 'package:flu_proj/app/di.dart';
import 'package:flu_proj/data/data_source/local_data_source.dart';
import 'package:flu_proj/presentation/resourses/router_manager.dart';
import 'package:flu_proj/presentation/resourses/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/strings_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences=instance<AppPreferences>();
  final LocalDataSource _localDataSource=instance<LocalDataSource>();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      padding: const EdgeInsets.all(AppPadding.p8),
      children: [
        ListTile(
          title: Text(
            AppStrings.changeLanguage,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          leading: const Icon(Icons.language_outlined),
          trailing: const Icon(Icons.arrow_back_ios),
          onTap: () {
            _changeLanguage();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.contactUS,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          leading: const Icon(Icons.contacts),
          trailing: const Icon(Icons.arrow_back_ios),
          onTap: () {
            _contactUs();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.inviteFriends,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          leading: const Icon(Icons.share),
          trailing: const Icon(Icons.arrow_back_ios),
          onTap: () {
            _inviteFriends();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.logout,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          leading: const Icon(Icons.logout_outlined),
          trailing: const Icon(Icons.arrow_back_ios),
          onTap: () {
            _logout();
          },
        ),
      ],
    ));
  }

  _changeLanguage() {}

  _contactUs() {}

  _inviteFriends() {}

  _logout() {
    _appPreferences.logout();
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);



  }
}
