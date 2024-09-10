import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../consts/kriptoinfo.dart';

class KriptoPara extends StatefulWidget {
  const KriptoPara({super.key});

  @override
  State<KriptoPara> createState() => _KriptoParaState();
}

class _KriptoParaState extends State<KriptoPara> {
  final List<KriptoInfo> kriptoList = [];

  Future<void> getKriptoPara() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.btcturk.com/api/v2/ticker'));

      if (response.statusCode == 200) {
        final data =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

        debugPrint(data.toString());

        for (final entry in data['data']) {
          final item = entry;

          if (item['denominatorSymbol'] != 'USDT') {
            final KriptoInfo kriptoInfo = KriptoInfo(
              pair: item['pair'] as String,
              last: double.tryParse(item['last'].toString()) ?? 0.0,
              high: double.tryParse(item['high'].toString()) ?? 0.0,
              low: double.tryParse(item['low'].toString()) ?? 0.0,
              dailypercentage:
                  double.tryParse(item['dailyPercent'].toString()) ?? 0.0,
              currencysymbol: item['denominatorSymbol'] as String,
              cryptosymbol: item['numeratorSymbol'] as String,
            );

            kriptoList.add(kriptoInfo);
          }
        }
      } else {
        debugPrint('Data could not be fetched: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
        title: Text(
          'Kripto Para Kurları',
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getKriptoPara(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (kriptoList.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: kriptoList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color.fromRGBO(28, 28, 28, 1),
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(
                              kriptoList[index].pair,
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Son Fiyat: ${kriptoList[index].last} ${kriptoList[index].currencysymbol}',
                                  style: GoogleFonts.poppins(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'En Yüksek: ${kriptoList[index].high} ${kriptoList[index].currencysymbol}',
                                  style: GoogleFonts.poppins(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'En Düşük: ${kriptoList[index].low} ${kriptoList[index].currencysymbol}',
                                  style: GoogleFonts.poppins(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Günlük Değişim: %${kriptoList[index].dailypercentage}',
                                  style: GoogleFonts.poppins(
                                    color:
                                        (kriptoList[index].dailypercentage) >= 0
                                            ? Colors.green
                                            : Colors.red,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
