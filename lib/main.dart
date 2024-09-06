import 'package:flutter/material.dart';
import 'package:habercepte/consts/colors.dart';
import 'package:habercepte/pages/kripto_para.dart';
import 'package:habercepte/pages/welcome.dart';
import 'pages/doviz_kurlari.dart';
import 'pages/kap_haberleri.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
      theme: color(),
      routes: {
        '/kap_haberleri': (context) => const KapHaberleri(),
        '/doviz_kurlari': (context) => const DovizKurlari(),
        '/kripto_para': (context) => const KriptoPara(),
      },
    );
  }
}