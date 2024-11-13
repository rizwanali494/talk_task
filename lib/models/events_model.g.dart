// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventsModelAdapter extends TypeAdapter<EventsModel> {
  @override
  final int typeId = 0;

  @override
  EventsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventsModel(
      title: fields[0] as String,
      remainderTime: fields[1] as String,
      eventDate: fields[2] as DateTime,
      eventTime: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EventsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.remainderTime)
      ..writeByte(2)
      ..write(obj.eventDate)
      ..writeByte(3)
      ..write(obj.eventTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecurringEventsModelAdapter extends TypeAdapter<RecurringEventsModel> {
  @override
  final int typeId = 1;

  @override
  RecurringEventsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecurringEventsModel(
      title: fields[0] as String,
      eventScheduledDate: fields[4] as DateTime,
      remainderTime: fields[1] as String,
      repeatingDays: (fields[2] as List).cast<bool>(),
      eventTime: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecurringEventsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.remainderTime)
      ..writeByte(2)
      ..write(obj.repeatingDays)
      ..writeByte(3)
      ..write(obj.eventTime)
      ..writeByte(4)
      ..write(obj.eventScheduledDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecurringEventsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
