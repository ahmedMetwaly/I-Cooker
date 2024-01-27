import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }

class AudioController with ChangeNotifier {
  late FlutterTts flutterTts;
  String language = "en-US";
  String engine = "com.google.android.tts";
  bool isCurrentLanguageInstalled = false;
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;
  AudioController() {
    initTts();
  }
  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      ttsState = TtsState.playing;
      notifyListeners();
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
      });
      notifyListeners();
    }

    flutterTts.setCompletionHandler(() {
      ttsState = TtsState.stopped;
      notifyListeners();
    });

    flutterTts.setCancelHandler(() {
      ttsState = TtsState.stopped;
      notifyListeners();
    });

    flutterTts.setPauseHandler(() {
      ttsState = TtsState.paused;
      notifyListeners();
    });

    flutterTts.setContinueHandler(() {
      ttsState = TtsState.continued;
      notifyListeners();
    });

    flutterTts.setErrorHandler((msg) {
      ttsState = TtsState.stopped;
      notifyListeners();
    });
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future speak(String newVoiceText) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.setPitch(1.0);

    if (newVoiceText.isNotEmpty ) {
      await flutterTts.speak(newVoiceText);
    }
  }

  Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1) {
      ttsState = TtsState.stopped;
      notifyListeners();
    }
  }

  Future pause() async {
    var result = await flutterTts.pause();
    if (result == 1) {
      ttsState = TtsState.paused;
      notifyListeners();
    }
  }
}
