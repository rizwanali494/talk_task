import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AudioService {
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecording = false;
  String? _audioFilePath;

  AudioService() {
    _audioRecorder = FlutterSoundRecorder();
  }

  // Initialize the recorder
  Future<void> init() async {
    await _audioRecorder!.openRecorder(isBGService: true);
  }

  // Start recording audio
  Future<void> startRecording() async {
    if (_isRecording) return;
    final dir = await getApplicationDocumentsDirectory();
    _audioFilePath = join(dir.path, 'audio_${DateTime.now().millisecondsSinceEpoch}.aac');

    await _audioRecorder?.startRecorder(
      toFile: _audioFilePath,
      codec: Codec.aacADTS,
    );

    _isRecording = true;
  }

  // Stop recording audio
  Future<String?> stopRecording() async {
    if (!_isRecording) return null;

    final result = await _audioRecorder?.stopRecorder();
    _isRecording = false;
    return _audioFilePath; // Returns the file path of the recorded audio
  }

  // Dispose of the recorder
  Future<void> dispose() async {
    await _audioRecorder?.closeRecorder();
  }
}
