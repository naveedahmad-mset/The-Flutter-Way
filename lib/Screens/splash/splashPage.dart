import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_assignment_1/Screens/tipCalculator/tipCalculatorPage.dart';  

class SplashPage extends StatefulWidget {

  const SplashPage({super.key, required this.title});

  final String title;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const TipCalculatorPage(title: 'Tip Calculator'))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
