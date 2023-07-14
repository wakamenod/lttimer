import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class AudioManager {
  final _clappingPlayer = AudioPlayer();
  final _bellPlayer = AudioPlayer();

  Future<void> init() async {
    _clappingPlayer.setAsset('assets/clapping.mp3');
    _bellPlayer.setAsset('assets/bell.mp3');
  }

  Future<void> playClapping() async {
    await _clappingPlayer.pause();
    await _clappingPlayer.seek(Duration.zero);
    await _clappingPlayer.play();
  }

  Future<void> playBell() async {
    await _bellPlayer.pause();
    await _bellPlayer.seek(Duration.zero);
    await _bellPlayer.play();
  }
}

final audioManagerProvider = Provider<AudioManager>((ref) {
  throw UnimplementedError();
});
