import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(radius: 50),
              const SizedBox(height: 10),
              Text(
                'Emirhan ÇOBAN',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Mobil Uygulama Geliştirici',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ));
  }
}
