import 'package:get/get.dart';
import 'locales/en.dart';
import 'locales/kh.dart';

class LanguageTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnLocalization.getLocalizationMap(),
        'km_KH': KhLocalization.getLocalizationMap(),
      };
}


