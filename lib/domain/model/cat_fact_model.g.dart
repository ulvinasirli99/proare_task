// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatFactResponseModelResponse extends TypeAdapter<CatFactResponseModel> {
  @override
  final int typeId = 1;

  @override
  CatFactResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatFactResponseModel(
      status: fields[0] as Status?,
      id: fields[1] as String?,
      user: fields[3] as String?,
      text: fields[4] as String?,
      type: fields[5] as String?,
      deleted: fields[6] as bool?,
      createdAt: fields[7] as DateTime?,
      updatedAt: fields[8] as DateTime?,
      v: fields[9] as int?,
      imageUrl: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CatFactResponseModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.user)
      ..writeByte(4)
      ..write(obj.text)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.deleted)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.v);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatFactResponseModelResponse &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StatusResponse extends TypeAdapter<Status> {
  @override
  final int typeId = 2;

  @override
  Status read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Status(
      verified: fields[10] as dynamic,
      sentCount: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    writer
      ..writeByte(2)
      ..writeByte(10)
      ..write(obj.verified)
      ..writeByte(11)
      ..write(obj.sentCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusResponse &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
