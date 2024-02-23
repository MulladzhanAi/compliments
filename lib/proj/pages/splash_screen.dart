import 'package:compliments/proj/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async{
    await Future.delayed(Duration(milliseconds: 3500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 105, 180, 0.9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Подождите немного.",
            style: TextStyle(
                fontSize: 18, color: Colors.black),
          ),
          Text(
            "Оцениваем Вашу красоту сегодня",
            style: TextStyle(
                fontSize: 18, color: Colors.black),
          ),
          SizedBox(height: 50,),
          Align(
            child: Image.asset('assets/images/giphy.gif'),
            alignment: Alignment.bottomCenter,
          ),

        ],
      ),
    );
  }
}
