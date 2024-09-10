import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
          title: Text(
            'Ayarlar',
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(28, 28, 28, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.notifications),
                      const SizedBox(width: 5),
                      Text(
                        'Bildirimleri Aç/Kapat',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
