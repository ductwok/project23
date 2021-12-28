// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RssModelAdapter extends TypeAdapter<RssModel> {
  @override
  final int typeId = 0;

  @override
  RssModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RssModel(
      image: fields[1] as String,
      title: fields[0] as String,
      link: fields[2] as String,
      detail: fields[3] as RssDetail?,
    );
  }

  @override
  void write(BinaryWriter writer, RssModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.detail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RssModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RssDetailAdapter extends TypeAdapter<RssDetail> {
  @override
  final int typeId = 1;

  @override
  RssDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RssDetail(
      detail: fields[2] as String,
      title: fields[0] as String,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RssDetail obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.detail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RssDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
