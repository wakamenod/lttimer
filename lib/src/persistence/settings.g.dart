// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 0;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      sessionMode: fields[0] as TimerType,
      sessionTime: fields[1] as Duration,
      longSessionTime: fields[2] as Duration,
      isContinuous: fields[3] as bool,
      intervalTime: fields[4] as Duration,
      bell1: fields[5] as Duration,
      bell2: fields[6] as Duration,
      bell3: fields[7] as Duration,
      longModeBell1: fields[8] as Duration,
      longModeBell2: fields[9] as Duration,
      longModeBell3: fields[10] as Duration,
      isDarkMode: fields[11] as bool,
      showCongratsAnimation: fields[12] as bool,
      congratsDanmakuComments: fields[13] == null ? '' : fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.sessionMode)
      ..writeByte(1)
      ..write(obj.sessionTime)
      ..writeByte(2)
      ..write(obj.longSessionTime)
      ..writeByte(3)
      ..write(obj.isContinuous)
      ..writeByte(4)
      ..write(obj.intervalTime)
      ..writeByte(5)
      ..write(obj.bell1)
      ..writeByte(6)
      ..write(obj.bell2)
      ..writeByte(7)
      ..write(obj.bell3)
      ..writeByte(8)
      ..write(obj.longModeBell1)
      ..writeByte(9)
      ..write(obj.longModeBell2)
      ..writeByte(10)
      ..write(obj.longModeBell3)
      ..writeByte(11)
      ..write(obj.isDarkMode)
      ..writeByte(12)
      ..write(obj.showCongratsAnimation)
      ..writeByte(13)
      ..write(obj.congratsDanmakuComments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TimerTypeAdapter extends TypeAdapter<TimerType> {
  @override
  final int typeId = 1;

  @override
  TimerType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TimerType.lightning;
      case 1:
        return TimerType.long;
      case 2:
        return TimerType.interval;
      default:
        return TimerType.lightning;
    }
  }

  @override
  void write(BinaryWriter writer, TimerType obj) {
    switch (obj) {
      case TimerType.lightning:
        writer.writeByte(0);
        break;
      case TimerType.long:
        writer.writeByte(1);
        break;
      case TimerType.interval:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
