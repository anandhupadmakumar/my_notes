// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyNoteModelAdapter extends TypeAdapter<MyNoteModel> {
  @override
  final int typeId = 1;

  @override
  MyNoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyNoteModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      content: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MyNoteModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyNoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
