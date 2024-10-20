import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/iu/general/colors.dart';
import 'package:flutter_codigo_youapp/iu/widgets/item_video_detail_widget.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            AspectRatio(
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      trailing:
                          Icon(Icons.keyboard_arrow_down, color: Colors.white),
                      title: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        'fdsf fdsf sdfsd fsdf fsdf. fsd f dsf ds f dsf dsf dsfsd f fsd f ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        '6.7 M de vistas - hace 2 anos',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ItemVideoDetailWidget(
                                text: '30 K',
                                icon: Icons.thumb_up_alt_outlined),
                            ItemVideoDetailWidget(
                                text: 'No me gusta',
                                icon: Icons.thumb_down_alt_outlined),
                            ItemVideoDetailWidget(
                                text: 'Compartir', icon: Icons.share),
                            ItemVideoDetailWidget(
                                text: 'Crear', icon: Icons.play_arrow_rounded),
                            ItemVideoDetailWidget(
                                text: 'Descargar',
                                icon: Icons.download_rounded),
                            ItemVideoDetailWidget(
                                text: 'Descargar',
                                icon: Icons.download_rounded),
                            ItemVideoDetailWidget(
                                text: 'Descargar',
                                icon: Icons.download_rounded),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white24,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/28935685/pexels-photo-28935685/free-photo-of-mesa-de-cafe-al-aire-libre-con-periodico-y-pajaros.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                      title: Text(
                        'Nombre del canal',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '2.3 M de suscriptores',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'SUSCRITO',
                            style: TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.notifications_none,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.white24,
                    ),
                    Container(
                      color: Colors.red,
                      height: 200,
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
