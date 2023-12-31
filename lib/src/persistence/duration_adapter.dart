import 'package:hive/hive.dart';

class DurationAdapter extends TypeAdapter<Duration> {
  @override
  final int typeId = 2;

  @override
  Duration read(BinaryReader reader) {
    return Duration(milliseconds: reader.read());
  }

  @override
  void write(BinaryWriter writer, Duration obj) {
    writer.write(obj.inMilliseconds);
  }
}
