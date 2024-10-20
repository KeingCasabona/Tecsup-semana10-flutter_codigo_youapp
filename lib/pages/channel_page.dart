import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/iu/general/colors.dart';

class ChannelPage extends StatefulWidget {
  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: kBrandPrimaryColor,
        title: Text(
          "Canal",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 2.7,
          tabs: [
            Tab(
              child: Text(
                'PAGINA PRINCIPAL',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                'VIDEOS',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                'LISTA DE REPRODUCCION',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                'COMUNIDAD',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        Container(
          child: Center(
            child: Text(
              'Pagina Principal',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Text(
              'Videos',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Text(
              'Lista de Reproduccion',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Text(
              'Comunidad',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
}
