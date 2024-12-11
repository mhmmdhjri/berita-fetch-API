import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:berita_api/model/response_berita.dart';

class NetClient {
  final String urlBerita=
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b73f51e0bf034362be4f2ca3cd653bec";

  final String urlTrending=
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=b73f51e0bf034362be4f2ca3cd653bec";  

  Future<ResponseBerita> fetchBerita() async {
    try {
      final response = await http.get(Uri.parse(urlBerita));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return ResponseBerita.fromJson(jsonData);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  Future<ResponseBerita> fetchTrending() async {
    try {
      final response = await http.get(Uri.parse(urlTrending));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return ResponseBerita.fromJson(jsonData);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
