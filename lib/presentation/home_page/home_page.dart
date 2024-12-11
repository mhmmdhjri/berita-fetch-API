import 'package:berita_api/model/response_berita.dart';
import 'package:berita_api/network/net_client.dart';
import 'package:berita_api/presentation/home_page/widget/item_berita.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexBar = 0;

  Future<ResponseBerita> fetchBerita() {
    if (indexBar == 0) {
      return NetClient().fetchBerita();
    } else {
      return NetClient().fetchTrending();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berita API"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: fetchBerita(),
          builder: (context, AsyncSnapshot<ResponseBerita> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              final articles = snapshot.data!.articles;
              return ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) {
                  return ItemBerita(
                    berita: articles[index],
                  );
                },
              );
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBar,
        onTap: (value) {
          setState(() {
            indexBar = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.article_rounded), label: "Berita"),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up_rounded), label: "Trending"),
        ],
      ),
    );
  }
}
