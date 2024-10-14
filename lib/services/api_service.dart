import 'dart:convert';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<VideoModel>> getVideos() async {
    List<VideoModel> videosModel = [];
    String _path =
        'https://youtube.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyDfWcEnaxhgVxjQYgU8VZK33abixmKGfCM&regionCode=PE&maxResults=20';
    Uri _uri = Uri.parse(_path);

    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List videos = myMap['item'];
      videosModel = videos.map((e) => VideoModel.fromJson(e)).toList();
      return videosModel;
    }
    return videosModel;
  }
}
