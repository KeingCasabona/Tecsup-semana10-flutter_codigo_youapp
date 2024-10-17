import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/models/channel_model.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/services/api_service.dart';

class ItemVideoWidget extends StatelessWidget {
  final VideoModel videoModel;
  ItemVideoWidget({required this.videoModel});

  Future<ChannelModel> _fetchChannel() async {
    return await ApiService().getChannel(videoModel.snippet.channelId);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                  width: double.infinity,
                  height: height * 0.3,
                  fit: BoxFit.cover,
                  videoModel.snippet.thumbnails.high.url),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  color: Colors.black.withOpacity(0.7),
                  child: Text(
                    '23:50',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          ListTile(
            //contentPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.only(left: 14),
            leading: FutureBuilder<ChannelModel>(
              future: _fetchChannel(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(
                        snapshot.data!.snippet.thumbnails.medium.url),
                  );
                } else {
                  return CircleAvatar(
                    backgroundColor: Colors.grey,
                  );
                }
              },
            ),
            trailing: Column(
              children: [
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
            title: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              videoModel.snippet.title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              '${videoModel.snippet.channelTitle} - 6.7 M de vistas - hace 2 anos',
              style: TextStyle(color: Colors.white54, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
