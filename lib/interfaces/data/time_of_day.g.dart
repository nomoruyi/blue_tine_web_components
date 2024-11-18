import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  final typeId = 3;

  @override
  TimeOfDay read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeOfDay(hour: fields[0] as int, minute: fields[1] as int);
  }

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hour)
      ..writeByte(1)
      ..write(obj.minute);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TimeOfDay && runtimeType == other.runtimeType && typeId == 002;
}