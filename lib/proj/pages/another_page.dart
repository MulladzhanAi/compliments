import 'package:compliments/proj/pages/gifs_widget.dart';
import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  const AnotherPage({required this.payload, super.key});

  final String payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 105, 180, 0.9),
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15,right: 15),
                child: Text(
              payload,
              style: TextStyle(fontSize: 18, color: Colors.black),
            )),
            SizedBox(height: 20,),
            GifsWidget(),
          ],
        ),
      ),
    );
  }
}
