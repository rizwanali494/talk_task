import 'dart:ui';

import 'package:hive/hive.dart';
part 'events_model.g.dart';


@HiveType(typeId: 0)
class EventsModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String remainderTime;

  @HiveField(2)
  DateTime eventDate;

  @HiveField(3)
  String eventTime;

  EventsModel({
    required this.title,
    required this.remainderTime,
    required this.eventDate,
    required this.eventTime,
  });



  @override
  String toString() {
    // TODO: implement toString
    return "Title:${title}    RemainderTime:${remainderTime}    EventDate:${eventDate}  EventTime:${eventTime}";
  }

}