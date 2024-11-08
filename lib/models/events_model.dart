import 'package:isar/isar.dart';
part 'events_model.g.dart';


@Collection()
class Event {
  Id? id;

  String eventTitle;
  DateTime time;
  DateTime remianderTime;
  DateTime date;

  Event({
    this.id,
    required this.eventTitle,
    required this.time,
    required this.remianderTime,
    required this.date,
  });
}
