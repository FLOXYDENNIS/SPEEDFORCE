// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border(
                  bottom: BorderSide(
                width: 0.5,
                color: Colors.black,
              )),
            ),
            child: AppBar(
              title: Text(
                'STAR-LIGHT NEWS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

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
