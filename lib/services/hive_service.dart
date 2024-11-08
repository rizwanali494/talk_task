import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/events_model.dart';


class HiveHelper {
  static Box? box;

  static Future<void> initHive() async {
    await Hive.initFlutter('jawad');
    Hive.registerAdapter(EventsModelAdapter());
    box = await Hive.openBox('youtube');
  }

  static Future<void> addDataInBox({required String boxName,
    required String key, required dynamic value,}) async {

    Box box = await Hive.openBox(boxName);
    await box.put(key, value);
    print('added key $key');
    // await box.close();
  }

  static Future<dynamic> getDataFromBox({required String boxName,
    required String key,}) async {
    var box = await Hive.openBox(boxName);
    var value = box.get(key);
    //await box.close();
    return value;
  }

  static Future<List> getBox({required String boxName}) async {
    try {
      var box = await Hive.openBox(boxName);
      var values = box.values.toList();
      //await box.close();
      return values;
    } catch (e) {
      print('Error fetching box $boxName: $e');
      return [];
    }
  }

  static Future<void> deleteDataFromBox({
    required String boxName,
    required String key,
  }) async {
    var box = await Hive.openBox(boxName);
    await box.delete(key);
    //await box.close();
  }

  static Future<void> clearBox({required String boxName}) async {
    var box = await Hive.openBox(boxName);
    await box.clear();
    print('cleared $boxName');
    //await box.close();
  }

  static Future<void> deleteBox({required String boxName}) async {
    var box = await Hive.openBox(boxName);
    await box.delete(boxName);
    print('deleted $boxName');
    await box.close();
  }

  static ValueListenable<Box>? getBoxListenable() {
    return box?.listenable();
  }
}