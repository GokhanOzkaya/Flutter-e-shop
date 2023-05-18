import 'package:flutter/material.dart';
import 'package:onlineshop/catagories.dart';
import 'package:onlineshop/components/bottomNavigationBar.dart';
import 'package:onlineshop/widgets.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width - 32;
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 55),
                child: ListView(children: [
                  //BASLIK
                  buildHeader(),
                  //BANNER
                  buildBanner(),
                  //BUTONLAR
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //İlk eleman
                        buildNavigationBar(
                            icon: Icons.menu_outlined, text: 'Catagories',context: context , widget: CategoriesPage(catagoryTitle: 'Categories',)),
                        buildNavigationBar(
                            icon: Icons.favorite_outline_outlined,text: 'Favories',context: context, widget: CategoriesPage(catagoryTitle: 'Favorites',)),
                        buildNavigationBar(
                            icon: Icons.show_chart, text: 'Best Sellings'),
                        buildNavigationBar(
                            icon: Icons.card_giftcard_outlined, text: 'Gifts'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  //SALES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sales',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1034)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      buildSalesItem(
                        deviceWidth: deviceWidth,
                        catagori: 'Smart Phones',
                        discountRate: '%50',
                        imageUrl:
                        'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_87300487/mobile_786_587_png/APPLE-iPhone-13-128-GB-Ak%C4%B1ll%C4%B1-Telefon-Starlight-MLPG3TU-A',
                      ),
                      buildSalesItem(
                        deviceWidth: deviceWidth,
                        catagori: 'Computers',
                        discountRate: '%25',
                        imageUrl:
                        'https://cdn.pixabay.com/photo/2013/07/12/15/04/monitor-149362_960_720.png',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      buildSalesItem(
                        deviceWidth: deviceWidth,
                        catagori: 'Smart Phones',
                        discountRate: '%50',
                        imageUrl:
                        'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_87300487/mobile_786_587_png/APPLE-iPhone-13-128-GB-Ak%C4%B1ll%C4%B1-Telefon-Starlight-MLPG3TU-A',
                      ),
                      buildSalesItem(
                        deviceWidth: deviceWidth,
                        catagori: 'Computers',
                        discountRate: '%25',
                        imageUrl:
                        'https://cdn.pixabay.com/photo/2013/07/12/15/04/monitor-149362_960_720.png',
                      ),
                    ],
                  ),
                  //SALES İTEMS
                ]),
              ),
              // BOTTOM NAVIGATION BAR
              buildBottomNavigationBar("home"),
            ],
          ),
        ));
  }
}
