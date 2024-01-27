import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:the_cooker/resources/constatns_manager.dart';
import 'package:the_cooker/resources/string_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.url, required this.mealTitle});
  final String url;
  final String mealTitle;
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

  late YoutubeMetaData _videoMetaData;
  double _volume = SizeManager.s100;
  bool _isPlayerReady = false;
  bool appBarHidden = false;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url) ??
          ConstantsManager.errorVideoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);

    _videoMetaData = const YoutubeMetaData();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.mealTitle)),
      body: SafeArea(
        child: YoutubePlayerBuilder(
          onEnterFullScreen: () =>
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive),
          onExitFullScreen: () =>
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Theme.of(context).colorScheme.primary,
            topActions: <Widget>[
              const SizedBox(width: SizeManager.s8),
              Expanded(
                child: Text(
                  _controller.metadata.title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: ConstantsManager.maxLines1,
                ),
              ),
            ],
            onReady: () {
              _isPlayerReady = true;
            },
          ),
          builder: (context, player) => ListView(
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(PaddingManager.mainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      _videoMetaData.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          StringManager.volume,
                        ),
                        Expanded(
                          child: Slider(
                            inactiveColor:
                                Theme.of(context).colorScheme.onPrimary,
                            value: _volume,
                            min: SizeManager.s0,
                            max: SizeManager.s100,
                            divisions: ConstantsManager.sliderDevision,
                            label: '${(_volume).round()}',
                            onChanged: _isPlayerReady
                                ? (value) {
                                    setState(() {
                                      _volume = value;
                                    });
                                    _controller.setVolume(_volume.round());
                                  }
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
