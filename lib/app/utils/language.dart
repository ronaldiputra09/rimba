import 'package:get/get.dart';
import 'package:test_rimba/app/languages/en.dart';
import 'package:test_rimba/app/languages/id.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'id_ID': id,
      };
}
