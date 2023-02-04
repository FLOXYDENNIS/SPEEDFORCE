// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, prefer_collection_literals, deprecated_member_use

import 'package:flutter/material.dart';
import 'home_page.dart';

class News {
  String id;
  String url;
  String title;
  String text;
  String publisher;
  String author;
  String image;
  String date;

  News(
    this.id,
    this.url,
    this.title,
    this.text,
    this.publisher,
    this.author,
    this.image,
    this.date,
  );

  News.fromJson(Map<String, dynamic> json) {
    return  News(
    id: json['id'];
    url: json['url'];
    title: json['title'];
    publisher: json['publisher'];
    author: json['author'];
    image: json['image'];
    date: json['date'];
  );
    
  }
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
