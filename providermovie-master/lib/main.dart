import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providermovie/provider/countprovider.dart';
import 'package:providermovie/provider/bottom_provider.dart';
import 'package:providermovie/provider/movie_provider.dart';
import 'package:providermovie/src/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => CountProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => BottomNavigationProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => MovieProvider()),
        ],
        child: Home(),
      ),
    );
  }
}
