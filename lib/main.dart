import 'package:flutter/material.dart';
import 'package:plannets/screens/home_page.dart';
import 'package:plannets/screens/plannets_page.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const HomePage(),
        'planets' : (context) => const Plannets(),
      },
    ),
  );
}
