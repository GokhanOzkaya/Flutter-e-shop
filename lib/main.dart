import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/Pages/profile.dart';
import 'package:onlineshop/Pages/searchPage.dart';
import 'package:onlineshop/Pages/cart.dart';
import 'package:onlineshop/Pages/homePage.dart';
import 'package:onlineshop/firebase_options.dart';
import 'package:onlineshop/utilities/sing_google.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => MyHomePage(),
        '/search': (context) => SearchPage(productTitle: 'Product1'),
        '/cart': (context) => cart(),
        '/profile': (context) => Profile(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFireBaseInitalied = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      initalizeFireBase();
      setState(() {
        isFireBaseInitalied = true;
      });
    });
  }

  Future<void> initalizeFireBase() async {
    await Firebase.initializeApp();
  }

  void gotoHomePage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MyHomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'İşleminiz gerçekleştiriliyor lütfen biraz bekleyin',
            textScaleFactor: 2,
          ),
          isFireBaseInitalied
              ? ElevatedButton (
                  onPressed: () async {
                    await signInWithGoogle();
                    gotoHomePage();
                  },
                  child: Text('Sign With Google'))
              : CircularProgressIndicator(),
        ],
      )),
    );
  }
}
