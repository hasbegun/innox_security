// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persisted_scan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersistedScanAdapter extends TypeAdapter<PersistedScan> {
  @override
  final int typeId = 1;

  @override
  PersistedScan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersistedScan(
      scanId: fields[0] as String,
      scanName: fields[1] as String,
      startTime: fields[2] as DateTime,
      targetType: fields[3] as String,
      targetName: fields[4] as String,
      probes: (fields[5] as List).cast<String>(),
      generations: fields[6] as int,
      evalThreshold: fields[7] as double,
      lastStatus: fields[8] as String?,
      lastProgress: fields[9] as double?,
      lastUpdate: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, PersistedScan obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.scanId)
      ..writeByte(1)
      ..write(obj.scanName)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.targetType)
      ..writeByte(4)
      ..write(obj.targetName)
      ..writeByte(5)
      ..write(obj.probes)
      ..writeByte(6)
      ..write(obj.generations)
      ..writeByte(7)
      ..write(obj.evalThreshold)
      ..writeByte(8)
      ..write(obj.lastStatus)
      ..writeByte(9)
      ..write(obj.lastProgress)
      ..writeByte(10)
      ..write(obj.lastUpdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersistedScanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
