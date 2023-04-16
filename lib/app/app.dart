import 'package:easy_localization/easy_localization.dart';
import 'package:flu_proj/app/app_prefs.dart';
import 'package:flu_proj/app/di.dart';
import 'package:flu_proj/presentation/resourses/theme_manager.dart';
import 'package:flutter/material.dart';

import '../presentation/resourses/router_manager.dart';

//will be singleton
class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key); //default constructor //كل مرة هندهله هيعملي انستنس جديد
  MyApp._internal(); //named constructor //to be singleton //private

  static final MyApp _instance =
      MyApp._internal(); //singleton or single instance

  // The static keyword is used for a class-level variable and method that is the same for every instance of a class,
  // this means if a data member is static,
  // it can be accessed without creating an object.
  // The static keyword allows data members to persist Values between different instances of a class
  factory MyApp() => _instance; //المصنع اللي بيرجعلي الانستنس اللي انا عايزها
////////////////////////////////////////
  //search for static snd factory
  ///////////////////////////////////////////
//A factory constructor gives more flexibility to create an object.
// Generative constructors only create an instance of the class. But,
// the factory constructor can return an instance of the class or even subclass.
//  It is also used to return the cached instance of the class.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getAppTheme(),
    );
  }
}
