// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_up_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetUpDataAdapter extends TypeAdapter<GetUpData> {
  @override
  final int typeId = 21;

  @override
  GetUpData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetUpData(
      fields[0] as PluginEnum,
      description:
          fields[2] == null ? 'Plugin Description' : fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GetUpData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.plugin)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetUpDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
