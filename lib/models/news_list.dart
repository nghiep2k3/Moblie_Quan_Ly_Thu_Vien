import 'package:flutter/material.dart';
import 'package:untitled4/models/news.dart';

class NewsList with ChangeNotifier {
  List<News> news = [
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
  ];
  List<News> get getNews => news;
  void addNews(
      {required String title,
      required DateTime date,
      required String coverImage,
      required String description}) {
    News newsItem = News(
        title: title,
        date: date,
        coverImage: coverImage,
        description: description);
    news.add(newsItem);
    notifyListeners();
  }

  void deleteNews(News newsItem) {
    news.remove(newsItem);
    notifyListeners();
  }
}
