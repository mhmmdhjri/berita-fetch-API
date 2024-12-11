import 'package:berita_api/model/berita.dart';
import 'package:berita_api/presentation/detail_page/detail_page.dart';
import 'package:flutter/material.dart';

class ItemBerita extends StatelessWidget {
  const ItemBerita({
    super.key,
    required this.berita,
  });

  final Articles berita;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                articles: berita,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(berita.urlToImage == null
                        ? 'https://picsum.photos/200/300'
                        : berita.urlToImage!),
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                berita.description == null
                ? "berita"
                : berita.description!,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    
                     ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
