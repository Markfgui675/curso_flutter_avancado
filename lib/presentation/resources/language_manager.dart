enum LanguageType{
  ENGLISH,
  ARABIC,
  PORTUGUESE
}

const String ENGLISH = "en";
const String ARABIC = "ar";
const String PORTUGUESE = "pt";

extension LanguageTypeExtension on LanguageType{
  String getValue(){
    switch(this){
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
      case LanguageType.PORTUGUESE:
        return PORTUGUESE;
      default:
        return ENGLISH;
    }
  }
}
