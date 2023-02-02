import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

void main() {
  runApp(NewsApp());
}

class _HomePageState extends State<HomePage> {
  static List<News> news = <News>[];
  static List<News> newsInApp = <News>[];

  Future<List<News>> comingNews() async {
    var url = 'https://newsapi.org/';
    var response = await http.get(Uri.parse(url));
    var news = <News>[];

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        news.add(News.fromJson(noteJson, newsjson.id, newsjson.url, title,
            author, publisher, image, date, text));
      }
    }
    return news;
  }

  @override
  void initState() {
    comingNews().then((value) {
      setState(() {
        news.addAll(value);
        newsInApp = news;
      });
    });
    super.initState();
  }
}
