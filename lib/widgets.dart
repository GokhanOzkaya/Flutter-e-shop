
import 'package:flutter/material.dart';

Widget buildBanner() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Container(

      width: double.infinity,
      padding:
      EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFF0001FC),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0001FC),
            Colors.greenAccent.withOpacity(0.8),
          ],
        ),
      ),

      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bose Home Speaker',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'USD 214',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Container(
              height: 75,
              child: Image.asset('assets/images/a.png'),
            )

          ]),
    ),
  );
}

Widget buildHeader() {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Text(
      'Home',
      style: TextStyle(
          fontSize: 34,
          color: Color(0xFF0A1034),
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    ),
  );
}

GestureDetector buildNavigationBar( {required String text,required IconData icon, Widget? widget , BuildContext? context}) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context!, MaterialPageRoute(builder:(context){return widget!;}));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19,vertical: 22),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE0ECF8),
          ),
          child: Icon(icon,color: Color(0xFF0001FC),size: 18,),
        ),
        SizedBox(height: 8),
        Center(child: Text(text,style: TextStyle(color: Color(0xFF1F53E4),fontWeight: FontWeight.w500),)),
      ],
    ),
  );
}

Container buildSalesItem({required double deviceWidth,required String catagori,required String imageUrl,required String discountRate}) {
  return Container(width: deviceWidth/2,
    padding:
    EdgeInsets.only (left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all (4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular (2),
              color: Color (0xFFE0ECF8)), // BoxDecoration
          child: Text(
            discountRate,
            style:
            TextStyle(color: Color (0xFF1F53E4), fontSize: 12),
          ),
        ),
        SizedBox(height: 22,),
        Container(child: Image.network(imageUrl,fit: BoxFit.scaleDown,)),
        SizedBox(height: 22,),
        Center(
          child: Text(catagori,
              style: TextStyle(
                  fontSize: 18, color: Color (0xFF0A1034))),
        ),
      ],
    ), // Column
  );
}