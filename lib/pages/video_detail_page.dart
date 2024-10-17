import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/iu/general/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailPage extends StatefulWidget {
  final String videoId;
  VideoDetailPage({required this.videoId});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playerController = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: Column(
        children: [
          SafeArea(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                controller: _playerController,
                progressColors: ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.red,
                  bufferedColor: Colors.white54,
                  //backgroundColor: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
