import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/iu/general/colors.dart';

class ItemFilterWidget extends StatelessWidget {
  final String text;
  final bool isSelected;

  ItemFilterWidget({
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
        backgroundColor: isSelected ? Colors.white : kBrandSecondaryColor,
      ),
    );
  }
}
