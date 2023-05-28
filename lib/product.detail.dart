import 'package:flutter/material.dart';
import 'package:onlineshop/Pages/cart.dart';
import 'package:onlineshop/components/bottomNavigationBar.dart';
import 'package:onlineshop/components/label.dart';
import 'package:onlineshop/header.dart';
import 'package:onlineshop/widgets.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;
  String productImageUrl;

  ProductDetailPage({required this.productTitle,required this.productImageUrl});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<Color> colorDataList = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];

  List<int> capatiesDataList = [64, 128, 258];
  late Color selectedColor;
  late int selectedOption;

  @override
  void initState() {
    super.initState();
    selectedColor = colorDataList[0];
    selectedOption = capatiesDataList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(context, widget.productTitle),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label(discountRate: 'New'),
                      ],
                    ),
                  ),

                  Center(
                      child: Container(
                          height: 250,
                          child: Image.network(
                            widget.productImageUrl,
                            //"https://cdn.pixabay.com/photo/2013/07/12/15/04/monitor-149362_960_720.png",
                            fit: BoxFit.scaleDown,
                          ))),
                  // RENK SEÇENEKLERİ
                  //https://www.apple.com/shop/product/FJVA3LL/A/Refurbished-24-inch-iMac-Apple-M1-Chip-with-8%E2%80%91Core-CPU-and-7%E2%80%91Core-GPU-Pink
                  //https://st-troy.mncdn.com/mnresize/1500/1500/Content/media/ProductImg/original/z14m001p2-imac-24-m1-8cpu-7gpu-4-5k-16gb-512gb-ssd-blue-637823328800616326.jpg
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Color",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A1034)),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ...colorDataList
                        .map((Color color) => colorPicker(
                            color: color,
                            isSelected: selectedColor == color,
                            onTap: () {
                              setState(() {
                                selectedColor = color;
                              });
                            }))
                        .toList(),
                  ]),
                  // KAPASİTE SEÇENEKLERİ
                  SizedBox(height: 32),
                  Text(
                    "Capacity",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A1034)), // TextStyle
                  ), // Text
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...capatiesDataList.map((int options) => capaties(
                          isActive: options == selectedOption,
                          option: options,
                          onTap: () {
                            setState(() {
                              selectedOption = options;
                            });
                          }))
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0038FC)),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){return cart(title: widget.productTitle,color: selectedColor,imageUrl:"https://cdn.pixabay.com/photo/2013/07/12/15/04/monitor-149362_960_720.png" ,option: selectedOption,price: 112,);} ));
                        },
                        child:
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text('Add to cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22),),
                        ),
                      ),
                  ),
                ],
              ),
            ),
            buildBottomNavigationBar("shop",context),
          ],
        ),
      ),
    );
  }
}
