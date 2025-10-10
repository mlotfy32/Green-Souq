// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedModelAdapter extends TypeAdapter<SavedModel> {
  @override
  final int typeId = 0;

  @override
  SavedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedModel(
      imageUrl: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as String,
      rating: fields[3] as String,
      servicesType: fields[4] as String,
      description: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.imageUrl)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.servicesType)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
