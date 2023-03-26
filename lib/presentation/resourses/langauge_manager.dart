enum LangaugeType { ENGLISH, ARAIC }

const String ARABIC="ar";
const String ENGLISH="en";

extension LangaugeTypeExtention on LangaugeType{
  String getValue()
  {
    switch(this){

      case LangaugeType.ENGLISH:
       return ENGLISH;
      case LangaugeType.ARAIC:
      return ARABIC;
    }


  }



}
