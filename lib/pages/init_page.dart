import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/iu/general/colors.dart';
import 'package:flutter_codigo_youapp/pages/home_page.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    Center(child: Text('Shorts')),
    Center(child: Text('Agregar')),
    Center(child: Text('Suscripciones')),
    Center(child: Text('Biblioteca')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrandPrimaryColor,
        elevation: 0,
        title: Container(
          alignment: Alignment.topLeft,
          child: Image.asset('assets/images/logo-1.png'),
          height: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.cast),
            color: Colors.white,
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none),
                color: Colors.white,
              ),
              Positioned(
                right: 1,
                top: 8,
                child: Stack(
                  children: [
                    Container(
                      height: 16,
                      width: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                    ),
                    Text(
                      ' 9+',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          SizedBox(width: 6),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white12,
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/774095/pexels-photo-774095.jpeg?auto=compress&cs=tinysrgb&w=400'),
          ),
          SizedBox(width: 14),
        ],
      ),
      body: _pages[_currentIndex],
      backgroundColor: kBrandPrimaryColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff212121),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow_rounded), label: 'Shorts'),
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 0),
                child: Icon(
                  Icons.add_circle_outline,
                  size: 46,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_rounded), label: 'Suscripciones'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_rounded), label: 'Biblioteca'),
        ],
      ),
    );
  }
}
