import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/models/document.dart';

class PopularDocument extends StatelessWidget {
  List<Document> documentList = [
    Document(
        title: 'Lập Trình Flutter',
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png"),
    Document(
        title: 'Lập Trình Flutter',
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png"),
    Document(
        title: 'Lập Trình Flutter',
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png"),
    Document(
        title: 'Lập Trình Flutter',
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png"),
    Document(
        title: 'Lập Trình Flutter',
        coverImage:
            "https://library.phenikaa-uni.edu.vn/sites/default/files/background%402x.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: documentList
          .map(
            (item) => Container(
                child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item.coverImage,
                        fit: BoxFit.cover,
                        width: 1000.0,
                        height: 2000,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            )),
          )
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );
  }
}
