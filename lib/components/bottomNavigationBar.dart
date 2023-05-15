import 'package:flutter/material.dart';
import '../widgets.dart';

Widget buildBottomNavigationBar (String page){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
          color: Color(0xFFEFF5FB),
          boxShadow: [BoxShadow(offset: Offset(0,-3),color: Colors.black.withOpacity(0.20),blurRadius: 30),]
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavIcon(icon: Icons.home_outlined,active: page=="home"),
          buildNavIcon(icon: Icons.search_rounded,active: page=="search"),
          buildNavIcon(icon: Icons.shopping_bag_outlined,active: page=="shop"),
          buildNavIcon(icon: Icons.person_outline_sharp,active: page=="profile"),
        ],
      ), // Row
    ),
  );
}