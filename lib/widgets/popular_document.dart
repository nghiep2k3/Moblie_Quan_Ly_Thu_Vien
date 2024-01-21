import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/models/document.dart';

class PopularDocument extends StatelessWidget {
  PopularDocument({super.key});
  final List<Document> documentList = [
    Document(
        title: 'Giáo trình Lý thuyết xác suất và thống kê toán',
        coverImage:
            "https://giaotrinhpdf.com/book_covers/2023/08/71c6c2c4f17d4e798cf4b678f7aa47d3.jpg"),
    Document(
        title: 'Mạch xử lý tín hiệu y sinh',
        coverImage:
            "https://images.nxbbachkhoa.vn/Picture/2023/4/26/image-20230426114619481.jpg"),
    Document(
        title:
            'Hackers IELTS Speaking Basic: Bộ sách luyện thi IELTS dành cho người mới bắt đầu có kèm giải thích đáp án chi tiết',
        coverImage:
            "https://cdn0.fahasa.com/media/flashmagazine/images/page_images/hackers_ielts_basic___speaking/2021_05_10_08_53_47_1-390x510.jpg"),
    Document(
        title:
            'Hackers IELTS Reading Basic: Bộ sách luyện thi IELTS dành cho người mới bắt đầu có kèm giải thích đáp án chi tiết',
        coverImage:
            "https://bizweb.dktcdn.net/100/468/166/products/966089ca-492c-427e-8579-0e7e8a745238.jpg?v=1677347698190"),
    Document(
        title:
            'Chẩn đoán, quản lý bệnh truyền nhiễm và nhiệt đới tại cộng đồng',
        coverImage:
            "https://bizweb.dktcdn.net/thumb/1024x1024/100/371/634/products/3d3d06cf-1288-4021-8296-b78b5bf6459a.jpg?v=1588323962440"),
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
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
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
