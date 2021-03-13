import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(ArthurDev());

class ArthurDev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArthurDev',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
