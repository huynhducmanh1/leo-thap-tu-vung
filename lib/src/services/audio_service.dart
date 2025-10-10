import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class AudioService {
  AudioService() {
    _audioPlayer = AudioPlayer();
  }

  late final AudioPlayer _audioPlayer;

  Future<void> playAudioFromUrl(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
      // You can add more robust error handling here
    }
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}

// Create a provider for our new service
final audioServiceProvider = Provider<AudioService>((ref) {
  final audioService = AudioService();
  ref.onDispose(() => audioService.dispose());
  return audioService;
});