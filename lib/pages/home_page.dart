import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/iu/general/colors.dart';
import 'package:flutter_codigo_youapp/iu/widgets/item_filter_widget.dart';
import 'package:flutter_codigo_youapp/iu/widgets/item_video_widget.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/services/api_service.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();

  List<VideoModel> videos = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    _apiService.getVideos().then((value) {
      videos = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          //horizontal: 14,
          vertical: 4,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          backgroundColor: kBrandSecondaryColor),
                      icon: Icon(
                        Icons.explore_rounded,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Explorar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 34,
                    child: VerticalDivider(
                      color: Colors.white30,
                      thickness: 1,
                    ),
                  ),
                  ItemFilterWidget(text: 'Todos', isSelected: true),
                  ItemFilterWidget(text: 'Framework', isSelected: false),
                  ItemFilterWidget(text: 'Paginas web', isSelected: false),
                  ItemFilterWidget(text: 'VideoJuegos', isSelected: false),
                ],
              ),
            ),
            SizedBox(height: 8),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: videos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemVideoWidget(
                    videoModel: videos[index],
                  );
                })
          ],
        ),
      ),
    );
  }
}
