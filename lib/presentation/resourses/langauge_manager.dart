import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, ARAIC }

const String ARABIC="ar";
const String ENGLISH="en";
const String ASSET_PATH_LOCALISATION="assets/translations";

const Locale ARABIC_LOCAL=Locale("ar","EG");
const Locale ENGLISH_LOCAL=Locale("en","US");


extension LangaugeTypeExtention on LanguageType{
  String getValue()
  {
    switch(this){

      case LanguageType.ENGLISH:
       return ENGLISH;
      case LanguageType.ARAIC:
      return ARABIC;
    }


  }



}
