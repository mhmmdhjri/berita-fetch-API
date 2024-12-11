import 'package:berita_api/model/berita.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.articles});

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.title!),
      ),
      body:SingleChildScrollView(
                child: Column(
                  children: [
                    if (articles.urlToImage != null)
                      InteractiveViewer(
                        child: Center(
                          child: Hero(
                            tag: articles.title ?? 'default-tag',
                            child: Image.network(articles.urlToImage!),
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        articles.description ?? 'No description available.',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(child: Text("Content",
                    style: TextStyle(fontWeight: FontWeight.w900),)),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(articles.content ?? "No content available."),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
