import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lospollos/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'model/cart_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Los Pollos Hermanos',
      theme: ThemeData(
        primaryColor: const Color(0XFFCF112B),
        scaffoldBackgroundColor: const Color(0xFFFDDB00),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFFCF112B),
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0XFFCF112B),
          selectedItemColor: Color(0xFFFDDB00),
          unselectedItemColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0XFFCF112B),


          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
