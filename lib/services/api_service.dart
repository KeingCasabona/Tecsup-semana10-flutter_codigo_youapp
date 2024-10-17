import 'dart:convert';
import 'package:flutter_codigo_youapp/models/channel_model.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<VideoModel>> getVideos() async {
    List<VideoModel> videosModel = [];
    String _path =
        '$pathProduction/search?part=snippet&key=$apiKey&regionCode=PE&maxResults=20';
    Uri _uri = Uri.parse(_path);

    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List videos = myMap['items'];
      videosModel = videos.map((e) => VideoModel.fromJson(e)).toList();
      return videosModel;
    }
    return videosModel;
  }

  Future<ChannelModel> getChannel(String channelId) async {
    String _path =
        '$pathProduction/channels?part=snippet&key=$apiKey&id=$channelId';
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List channels = myMap['items'];
      if (channels.isNotEmpty) {
        return ChannelModel.fromJson(channels[0]);
      }
    }
    throw Exception("No se pudo cargar el canal");
  }
}
