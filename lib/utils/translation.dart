import 'package:get/get.dart';
import 'package:senior_project/utils/arabic.dart';
import 'package:senior_project/utils/english.dart';

class Translation extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'english':english,
    'arabic':arabic,
  };

}