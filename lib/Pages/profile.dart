import 'package:flutter/material.dart';
import 'package:onlineshop/components/bottomNavigationBar.dart';
import 'package:onlineshop/header.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _SeachPageState();
}

class _SeachPageState extends State<Profile> {
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
                        'Fatma Nur Arıkoğlu',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Software Developer',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu risus vitae orci interdum varius ac vel felis.',
                        style: TextStyle(fontSize: 16),
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
