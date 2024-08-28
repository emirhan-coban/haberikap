import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:habercepte/consts/newsinfo.dart';
import 'package:url_launcher/url_launcher.dart';

class KapHaberleri extends StatefulWidget {
  const KapHaberleri({super.key});

  @override
  State<KapHaberleri> createState() => _KapHaberleriState();
}

class _KapHaberleriState extends State<KapHaberleri> {
  List<NewsInfo> newsData = [];

  Future<void> getNews() async {
    try {
      final response = await http
          .get(Uri.parse('https://www.kap.org.tr/tr/api/disclosures'));

      if (response.statusCode == 200) {
        final allNews = jsonDecode(utf8.decode(response.bodyBytes));

        // Clear existing newsData
        newsData.clear();

        for (var news in allNews) {
          NewsInfo newsInfo = NewsInfo(
            title: news['basic']['title'] ?? 'Başlık yok',
            publishDate: news['basic']['publishDate'] ?? 'Tarih yok',
            companyName: news['basic']['companyName'] ?? 'Şirket adı yok',
            summary: news['basic']['summary'] ?? 'Özet yok',
            stockCodes: news['basic']['stockCodes'] ?? 'Hisse kodu yok',
            link: news['basic']['disclosureIndex'] ?? 'Link yok',
          );
          newsData.add(newsInfo);
        }
        // Refresh the UI
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
      appBar: AppBar(
        title: Text(
          'Günün KAP Haberleri',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getNews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Bir hata oluştu: ${snapshot.error}'),
            );
          } else if (newsData.isEmpty) {
            return const Center(
              child: Text('Haber bulunamadı.'),
            );
          } else {
            return ListView.builder(
              itemCount: newsData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    launchUrl(
                      Uri.parse(
                        'https://kap.org.tr/tr/Bildirim/${newsData[index].link}',
                      ),
                    );
                  },
                  title: Text(
                    newsData[index].companyName,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    newsData[index].title,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                  leading: Text(
                    "Bugün\n${newsData[index].publishDate.substring(6, 11)}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            );
          }
        },
      ),
    );
  }
}
