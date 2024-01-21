import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled4/models/news.dart';

class NewsList extends StatelessWidget {
  NewsList({super.key});
  final List<News> news = [
    News(
        title: 'Chương trình "Phát triển kĩ năng đọc trong thời đại 4.0"',
        date: DateTime.parse('2024-01-11'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    News(
        title: 'Hướng dẫn đăng nhập tài khoản thư viện',
        date: DateTime.parse('2024-01-05'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/HD%20Dang%20nhap%20thu%20vien%20dien%20tu%20-%20thu%20vien%20so_1.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    News(
        title: 'Những góc đọc và tự học thật chill cùng thư viện Phenikaa Uni',
        date: DateTime.parse('2023-12-29'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/IMG_7624_1.JPG",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    News(
        title: 'Hội sách mùa thu phenikaa 2023 - gắn kết bạn đọc với sách',
        date: DateTime.parse('2023-12-23'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/phe7355.JPG",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    News(
        title:
            'Khai trương Trung tâm thông tin thư viện mới - Thư viện chuẩn “Trường người ta” tại Phenikaa',
        date: DateTime.parse('2023-08-14'),
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/_PHE1294_0.JPG",
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
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
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
