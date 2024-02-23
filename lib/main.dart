import 'dart:math';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:compliments/notifications/local_notifications.dart';
import 'package:compliments/proj/pages/splash_screen.dart';
import 'package:compliments/proj/static_data.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    Random random=new Random();
    final randomIndex=random.nextInt(97);
    LocalNotifications.showSimpleNotification(
        title: "(〃＾▽＾〃)", body: StaticData.compliments[randomIndex], payload: StaticData.compliments[randomIndex]);
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();

  Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  Workmanager().registerPeriodicTask(
      "dailyNotificationTask", "ComplimentDaileNotif",
      frequency: Duration(hours: 8));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: (AppBarTheme(color: Color.fromRGBO(255, 105, 180, 0.7),))
      ),
      home: SplashScreen(),
         // AnimatedSplashScreen(splash: SplashScreen(), nextScreen: HomePage(),duration: 5000,),
    );
  }
}
