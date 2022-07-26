import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheHelper
{
  static var box = Hive.box('dark');

  static void putData({
  required String key,
  required bool value,
})
  {
    box.put(key, value);
  }

  static bool getData({ required String key,  })
  {
    return box.get(key);
  }

}