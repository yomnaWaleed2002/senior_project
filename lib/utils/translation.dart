import 'package:get/get.dart';
import 'package:senior_project/utils/arabic.dart';
import 'package:senior_project/utils/english.dart';

class Translation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'ur_PK': ur_PK,
      };
}
