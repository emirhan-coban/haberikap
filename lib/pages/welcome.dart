import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile_page');
          },
          icon: Icon(Icons.account_circle,
              color: Theme.of(context).colorScheme.secondary, size: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings_page');
            },
            icon: Icon(Icons.settings,
                color: Theme.of(context).colorScheme.secondary, size: 30),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Gündemden uzak\nkalmayın,\n"HaberiKAP"ın!',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.newspaper,
                          size: 50,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Günün\nKAP Haberleri',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(28, 28, 28, 1),
                              ),
                            ),
                            Text(
                              "KAP'ta yer alan güncel\nhaberlere göz atın.",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color.fromRGBO(28, 28, 28, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/kap_haberleri');
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Diğer Hizmetlerimiz,',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.trending_up,
                          size: 50,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Borsa İstanbul\nHisse Senetleri',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(28, 28, 28, 1),
                              ),
                            ),
                            Text(
                              "Borsa İstanbul\nhisse senetlerine erişin.",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color.fromRGBO(28, 28, 28, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {
                          launchUrl(
                            Uri.parse(
                              'https://tr.investing.com/equities/turkey',
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.monetization_on,
                          size: 50,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Döviz Kurları',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(28, 28, 28, 1),
                              ),
                            ),
                            Text(
                              "Döviz kurlarını\nanlık olarak takip edin.",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color.fromRGBO(28, 28, 28, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/doviz_kurlari');
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.money_outlined,
                          size: 50,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kripto Paralar',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(28, 28, 28, 1),
                              ),
                            ),
                            Text(
                              "Kripto paraların\nanlık değerlerini görün.",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color.fromRGBO(28, 28, 28, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/kripto_para');
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
