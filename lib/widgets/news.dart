import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled4/models/news.dart';

class NewsManagement extends StatelessWidget {
  NewsManagement({super.key});
  final List<News> news = [
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png"),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png"),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png"),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png"),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png"),
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: news.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: SizedBox(
            width: width / 2 - 20,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  news[index].coverImage,
                  //   width: 100,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  news[index].title,
                  style: const TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      height: 1.5),
                  maxLines: 2,
                ),
              ),
              Text(DateFormat('dd/MM/yyyy').format(news[index].date),
                  style: const TextStyle(fontSize: 12)),
            ]),
          ),
        );
      },
    );
  }
}
