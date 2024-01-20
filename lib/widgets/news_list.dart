import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled4/models/news.dart';

class NewsList extends StatelessWidget {
  NewsList({super.key});
  final List<News> news = [
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    News(
        title: 'Lập Trình Flutter',
        date: DateTime.parse('2021-06-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
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
