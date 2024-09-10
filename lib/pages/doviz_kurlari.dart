import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habercepte/consts/dovizinfo.dart';
import 'package:http/http.dart' as http;

class DovizKurlari extends StatefulWidget {
  const DovizKurlari({super.key});

  @override
  State<DovizKurlari> createState() => _DovizKurlariState();
}

class _DovizKurlariState extends State<DovizKurlari> {
  List<DovizInfo> dovizData = [];

  Future<void> getDoviz() async {
    try {
      final response =
          await http.get(Uri.parse('https://finans.truncgil.com/today.json'));

      if (response.statusCode == 200) {
        final allDoviz =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

        // Clear existing dovizData
        dovizData.clear();

        allDoviz.forEach((key, value) {
          // Check if the value is a Map and contains expected keys
          if (value is Map<String, dynamic>) {
            DovizInfo dovizInfo = DovizInfo(
              currencyName: key,
              buying: value['Alış'].toString(),
              selling: value['Satış'].toString(),
              type: value['Tür'].toString(),
              change: value['Değişim'].toString(),
            );
            dovizData.add(dovizInfo);
          }
        });
      } else {
        debugPrint('Veri alınamadı: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Hata: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
          title: Text(
            'Güncel Döviz Kurları',
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
          future: getDoviz(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (dovizData.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: 66,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromRGBO(28, 28, 28, 1),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            dovizData[index].currencyName,
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Alış: ${dovizData[index].buying}TL | Satış: ${dovizData[index].selling}TL',
                                style: GoogleFonts.poppins(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Değişim: ${dovizData[index].change}',
                            style: GoogleFonts.poppins(
                              color: double.parse(dovizData[index]
                                          .change
                                          .replaceAll("%", "")
                                          .replaceAll(",", ".")) >=
                                      0
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
