import 'package:flutter/material.dart';

class ItemVideoWidget extends StatelessWidget {
  const ItemVideoWidget({super.key});

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
                  'https://images.pexels.com/photos/257904/pexels-photo-257904.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
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
            leading: CircleAvatar(
              backgroundColor: Colors.white12,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
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
              'Lorem jfkdjfksdjfjdsl hkdakldj lksjk jj j fdsf sdf fsdf sdf sdf fdsf. fsd fds fds fds fdsf dsf sdf sd',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              'Alanxelmundo de prueba - 6.7 M de vistas - hace 2 anos',
              style: TextStyle(color: Colors.white54, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
