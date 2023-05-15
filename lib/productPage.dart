import 'package:flutter/material.dart';
import 'package:onlineshop/components/bottomNavigationBar.dart';
import 'package:onlineshop/header.dart';
import 'package:onlineshop/widgets.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
  List<Map> products =[
    {"name":"Excalibur","photoUrl":"https://pngimg.com/uploads/laptop/laptop_PNG101774.png","price":"999"},
    {"name":"Excalibur 1","photoUrl":"https://pngimg.com/uploads/laptop/laptop_PNG101774.png","price":"999"},
    {"name":"Excalibur 2","photoUrl":"https://pngimg.com/uploads/laptop/laptop_PNG101774.png","price":"999"},
    {"name":"Excalibur 3","photoUrl":"https://pngimg.com/uploads/laptop/laptop_PNG101774.png","price":"999"},
    {"name":"Excalibur 5","photoUrl":"https://pngimg.com/uploads/laptop/laptop_PNG101774.png","price":"999"},
    {"name":"Excalibur 6","photoUrl":"https://pngimg.com/uploads/laptop/laptop_PNG101774.png","price":"999"},
    {"name":"Excalibur 7","photoUrl":"https://pngimg.com/uploads/laptop/laptop_PNG101774.png","price":"999"},
  ];

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //header1
                  buildPagesHeader(header:'Asus From Print', context: context,catagories: []),
                //content
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: products.map((product) {
                    return buildContent(product["name"], product["photoUrl"], product["price"]);
                  }).toList(),
                ),
              ),
                  //bottomnavigation

                ],
              ),
            ),
            buildBottomNavigationBar("search"),
          ],
        ),
      ),
    );
  }
}
Widget buildContent(String title, String photoUrl, String price) {
  return GestureDetector(
    onTap: (){},
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: Offset(0, 16),
          ), // BoxShadow
        ],
      ), // BoxDecoration
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(photoUrl,fit: BoxFit.scaleDown,),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color (0xFF0A1034),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ), // Textstyle
              ), // Text
              Text(
                "USD $price",
                style: TextStyle(
                  color: Color (0xFF0001FC),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ), // TextStyle
              ), // Text

            ],
          ),
        ],
      ),
    ),
  );
}
