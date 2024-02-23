
import 'dart:math';

import 'package:compliments/notifications/local_notifications.dart';
import 'package:compliments/proj/bloc/compliment_events.dart';
import 'package:compliments/proj/bloc/compliment_state.dart';
import 'package:compliments/proj/pages/another_page.dart';
import 'package:compliments/proj/pages/gifs_widget.dart';
import 'package:compliments/proj/static_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/compliment_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = ComplimentBloc();

  @override
  void initState() {
   // bloc.add(ComplimentGetEvent());
    listenToNotifications();
    super.initState();
  }


  listenToNotifications(){
    LocalNotifications.onClickNotification.stream.listen((event) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AnotherPage(payload: event)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 105, 180, 0.9),
        appBar: AppBar(
          title: const Text("(⌒‿⌒)"),
          leading: Image.asset('assets/images/lead.png'),
          centerTitle: true,
        ),
        body: BlocProvider<ComplimentBloc>(
          create: (BuildContext context) => bloc,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<ComplimentBloc, ComplimentState>(
                    builder: (BuildContext context, ComplimentState state) {
                      if (state is ComplimentEmptyState) {
                        return Container(child: const Text("Нажми на кнопку (◕‿◕)",
                          style: TextStyle(fontSize: 18, color: Colors
                              .black),));
                      }
                      if (state is ComplimentLoadingState) {
                        return const CircularProgressIndicator();
                      }
                      if (state is ComplimentLoadedState) {
                        return Container(
                          padding: EdgeInsets.only(left: 15,right: 15),
                            child: Text(
                              state.compliment.text,
                              style: const TextStyle(fontSize: 18, color: Colors
                                  .black),
                            ));
                      } else {
                        return const Text("Error");
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                  Material(
                    elevation: 5,
                    color: const Color(0xFF00FF),
                    borderRadius: BorderRadius.circular(15.0),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width*0.8,
                      height: 55,
                      onPressed: () {
                     //  LocalNotifications.showSimpleNotif(title:"(◕‿◕)♡", body: StaticData.compliments[2], payload: StaticData.compliments[2]);
                       Random random=new Random();
                       int randomIndex=random.nextInt(StaticData.compliments.length-1);
                        LocalNotifications.showSimpleNotification(title: '(◕‿◕)♡', body: StaticData.compliments[randomIndex], payload: StaticData.compliments[randomIndex]);
/*
                        LocalNotifications.showScheduleNotifications(
                            title: "dfd",
                            body: StaticData.compliments[2],
                            payload: StaticData.compliments[2]);
*/
                        bloc.add(ComplimentGetEvent());


                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Text("Тык* (*˘︶˘*).｡.:*♡", style: TextStyle(
                              color: Colors.black, fontSize: 16),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(

                                child: const Icon(Icons.arrow_forward,color: Colors.black,),
                                padding: const EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF00FF),
                                  shape: BoxShape.circle,
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                  ),
                  GifsWidget(),
                ],
              )),
        ));
  }
}
