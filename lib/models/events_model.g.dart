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
      eventTime: fields[3] as DateTime,
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
