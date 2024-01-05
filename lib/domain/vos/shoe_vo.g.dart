// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoeVoAdapter extends TypeAdapter<ShoeVo> {
  @override
  final int typeId = 1;

  @override
  ShoeVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoeVo(
      id: fields[1] as String?,
      sku: fields[2] as String?,
      brand: fields[3] as String?,
      name: fields[4] as String?,
      colorway: fields[5] as String?,
      gender: fields[6] as String?,
      silhouette: fields[7] as String?,
      releaseYear: fields[8] as String?,
      releaseDate: fields[9] as String?,
      retailPrice: fields[10] as int?,
      estimatedMarketValue: fields[11] as int?,
      story: fields[12] as String?,
      color: (fields[13] as List?)?.cast<String>(),
      country: (fields[14] as List?)?.cast<String>(),
      size: (fields[15] as List?)?.cast<int>(),
      image: fields[16] as Image?,
      links: fields[17] as Links?,
      isFavourite: fields[18] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ShoeVo obj) {
    writer
      ..writeByte(18)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.sku)
      ..writeByte(3)
      ..write(obj.brand)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.colorway)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.silhouette)
      ..writeByte(8)
      ..write(obj.releaseYear)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.retailPrice)
      ..writeByte(11)
      ..write(obj.estimatedMarketValue)
      ..writeByte(12)
      ..write(obj.story)
      ..writeByte(13)
      ..write(obj.color)
      ..writeByte(14)
      ..write(obj.country)
      ..writeByte(15)
      ..write(obj.size)
      ..writeByte(16)
      ..write(obj.image)
      ..writeByte(17)
      ..write(obj.links)
      ..writeByte(18)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoeVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageAdapter extends TypeAdapter<Image> {
  @override
  final int typeId = 2;

  @override
  Image read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Image(
      the360: (fields[1] as List?)?.cast<dynamic>(),
      original: fields[2] as String?,
      small: fields[3] as String?,
      thumbnail: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Image obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.the360)
      ..writeByte(2)
      ..write(obj.original)
      ..writeByte(3)
      ..write(obj.small)
      ..writeByte(4)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LinksAdapter extends TypeAdapter<Links> {
  @override
  final int typeId = 3;

  @override
  Links read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Links(
      stockX: fields[1] as String?,
      goat: fields[2] as String?,
      flightClub: fields[3] as String?,
      stadiumGoods: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Links obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.stockX)
      ..writeByte(2)
      ..write(obj.goat)
      ..writeByte(3)
      ..write(obj.flightClub)
      ..writeByte(4)
      ..write(obj.stadiumGoods);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
