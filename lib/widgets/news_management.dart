import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/models/news.dart';
import 'package:untitled4/models/user_interface.dart';
import 'package:untitled4/widgets/addNews.dart';

class NewsManagement extends StatefulWidget {
  const NewsManagement({super.key});

  @override
  State<NewsManagement> createState() => _NewsManagementState();
}

class _NewsManagementState extends State<NewsManagement> {
  List<News> news = [
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
  void _addNews(News newsItem) {
    setState(() {
      news.add(newsItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<UserInterface>(builder: (context, ui, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              'Quản lý tin tức',
              style:
                  TextStyle(color: ui.isDarkMode ? Colors.white : Colors.black),
            ),
            backgroundColor: ui.appBarColor,
            iconTheme: IconThemeData(
                color: ui.isDarkMode ? Colors.white : Colors.black),
          ),
          body: DefaultTextStyle(
            style:
                TextStyle(color: ui.isDarkMode ? Colors.white : Colors.black),
            child: Container(
              width: width,
              padding: const EdgeInsets.all(10.0),
              color: ui.isDarkMode ? Colors.grey : Colors.white,
              child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          news.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Đã xóa ${news[index].title}')));
                      },
                      background: Container(
                        color: Colors.red,
                      ),
                      child: Column(
                        children: [
                          Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  // child: Image.network(
                                  //   news[index].coverImage,
                                  //   width: 100,
                                  //   height: 120,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  child: news[index].coverImage != ''
                                      ? (news[index]
                                              .coverImage
                                              .contains('https://')
                                          ? Image.network(
                                              news[index].coverImage,
                                              width: 100,
                                              height: 120,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.file(
                                              File(news[index].coverImage),
                                              width: 100,
                                              height: 120,
                                              fit: BoxFit.cover,
                                            ))
                                      : SizedBox(
                                          width: 100,
                                          height: 120,
                                          child: Container(
                                            color: ui.isDarkMode
                                                ? Colors.white
                                                : Colors.grey,
                                            child: const Icon(Icons.image),
                                          ))),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    news[index].title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(DateFormat('dd/MM/yyyy')
                                      .format(news[index].date)),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                    width: width - 150,
                                    child: Text(
                                      news[index].description,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: const TextStyle(height: 1.5),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          )
                        ],
                      ));
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddNews(onAddNews: _addNews),
                ),
              );
            },
            backgroundColor: ui.isDarkMode ? Colors.white : Colors.grey,
            foregroundColor: ui.isDarkMode ? Colors.black : Colors.white,
            child: const Icon(Icons.add),
          ));
    });
  }
}
