import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/Pages/login_page.dart';
import 'package:onlineshop/components/bottomNavigationBar.dart';
import 'package:onlineshop/header.dart';
import 'package:onlineshop/utilities/sing_google.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _SeachPageState();
}

class _SeachPageState extends State<Profile> {
  bool isDarkMode = false;
  bool isBoldText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 55),
              child: ListView(
                children: [
                  Header(context, 'Profile'),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: Image.network(
                          'https://media.licdn.com/dms/image/D4D03AQHDNpgy_TaHNg/profile-displayphoto-shrink_800_800/0/1639002709025?e=2147483647&v=beta&t=sY3PFXs22t32-dv5ovQhcHCTmMo47E2Vp22KOZpDpqE',
                        ).image,
                      ),

                      SizedBox(height: 16),
                      Text(
                        FirebaseAuth.instance.currentUser!.displayName!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        FirebaseAuth.instance.currentUser!.email!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Ayarlar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Divider(thickness: 3,height: 10),

                      ListTile(title: Text('Yardım Geri Bildirim'),leading:Icon(Icons.feedback)),
                      ListTile(title: Text('Gizlilik ve Erişilebilirlik'),leading:Icon(Icons.lock)),
                      ListTile(title: Text('Dil ve Saat'),leading:Icon(Icons.timelapse_outlined)),

                      ListTile(
                        title: Text('Dark Mode'),
                        trailing: Switch(
                          value: isDarkMode,
                          onChanged: (value) {
                            setState(() {
                              isDarkMode=value;
                              print(isDarkMode);
                              print(value);
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('Kalın yazı'),
                        trailing: Switch(
                          value: isBoldText,
                          onChanged: (value) {
                            setState(() {
                              isBoldText=value;
                              print(isBoldText);
                              print(value);
                            });
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.logout_outlined,color: Colors.red,),
                        title: Text(' Bu Hesapdan Çıkış Yap',style: TextStyle(color: Colors.red),),
                        onTap: ()  async {
                          // Burada ayarlar sayfanıza yönlendirebilirsiniz.
                          await signOutWithGoogle();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                        },
                      ),


                    ],
                  ),
                ],
              ),
            ),
            buildBottomNavigationBar('profile', context),
          ],
        ),
      ),
    );
  }
}
