import 'package:flutter/material.dart';

class DovizKurlari extends StatelessWidget {
  const DovizKurlari({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Döviz Kurları',
          style: TextStyle(
            fontFamily: "Deutsch",
            fontSize: 55,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
