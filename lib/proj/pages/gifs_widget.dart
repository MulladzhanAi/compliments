import 'dart:math';

import 'package:compliments/proj/static_data.dart';
import 'package:flutter/material.dart';

class GifsWidget extends StatefulWidget {
  const GifsWidget({super.key});

  @override
  State<GifsWidget> createState() => _GifsWidgetState();
}

class _GifsWidgetState extends State<GifsWidget> {

  late int randomIndex;

  @override
  void initState() {
    randomIndex=getRandom();
    super.initState();
  }

  int getRandom(){
      Random random=Random();
      int randomNumber = random.nextInt(StaticData.gifs.length-1);
      return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      child: Image.asset(StaticData.gifs[randomIndex]),
    );
  }
}
