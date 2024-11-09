import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/events_model.dart';

class HiveHelper {

  static Future<void> initHive() async {
    await Hive.initFlutter('jawad');
    Hive.registerAdapter(EventsModelAdapter());
  }

  static Future<void> addDataInBox({
    required String boxName,
    required String key,
    required dynamic value,
  }) async {
    var box = await Hive.openBox(boxName);
    try {
      await box.put(key, value);
      print('Added key $key to $boxName');
    } catch (e) {
      print('Error adding data to box $boxName: $e');
    } finally {
      await box.close();
    }
  }

  static Future<void> addEventInBox({
    required String boxName,
    required String key,
    required EventsModel value,
  }) async {
    var box = await Hive.openBox(boxName);
    try {
      await box.put(key, value);
      print('Added key $key to $boxName');
    } catch (e) {
      print('Error adding event to box $boxName: $e');
    } finally {
      await box.close();
    }
  }

  static Future<dynamic> getDataFromBox({
    required String boxName,
    required String key,
  }) async {
    var box = await Hive.openBox(boxName);
    try {
      var value = box.get(key);
      return value;
    } catch (e) {
      print('Error fetching data from box $boxName: $e');
      return null;
    } finally {
      await box.close();
    }
  }

  static Future<List> getBox({required String boxName}) async {
    var box = await Hive.openBox(boxName);
    try {
      var values = box.values.toList();
      return values;
    } catch (e) {
      print('Error fetching values from box $boxName: $e');
      return [];
    } finally {
      await box.close();
    }
  }

  static Future<void> deleteDataFromBox({
    required String boxName,
    required String key,
  }) async {
    var box = await Hive.openBox(boxName);
    try {
      await box.delete(key);
      print('Deleted key $key from $boxName');
    } catch (e) {
      print('Error deleting data from box $boxName: $e');
    } finally {
      await box.close();
    }
  }

  static Future<void> clearBox({required String boxName}) async {
    var box = await Hive.openBox(boxName);
    try {
      await box.clear();
      print('Cleared all data in $boxName');
    } catch (e) {
      print('Error clearing box $boxName: $e');
    } finally {
      await box.close();
    }
  }

  static Future<void> deleteBox({required String boxName}) async {
    var box = await Hive.openBox(boxName);
    try {
      await box.deleteFromDisk();
      print('Deleted box $boxName');
    } catch (e) {
      print('Error deleting box $boxName: $e');
    } finally {
      await box.close();
    }
  }
}
