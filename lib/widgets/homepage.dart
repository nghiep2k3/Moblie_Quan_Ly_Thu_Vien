import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled4/widgets/news.dart';
import 'package:untitled4/widgets/popular_document.dart';

import '/widgets/components/my_drawer.dart';
import '/models/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Trang chủ",
              style: TextStyle(color: Color(0xffffffff)),
            ),
            backgroundColor: ui.appBarColor,
          ),

          drawer: MyDrawer(),

          //   body: Center(
          //     child: Text(
          //       "Trang chủ",
          //       style: TextStyle(
          //         fontSize: ui.fontSize,
          //       ),
          //     ),
          //   ),
          body: Container(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  SizedBox(
                    //   width: 100,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Tìm kiếm",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width / 5 - 20,
                          //   height: 100,
                          child: Column(
                            children: [
                              IconButton(
                                padding: EdgeInsets.all(10),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/quanly");
                                },
                                icon: const Icon(
                                  Icons.info,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              const Text(
                                "Giới thiệu",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width / 5 - 20,
                          //   height: 100,
                          child: Column(
                            children: [
                              IconButton(
                                padding: EdgeInsets.all(10),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/quanly");
                                },
                                icon: const Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              const Text(
                                "Thông báo",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width / 5 - 20,
                          child: Column(
                            children: [
                              IconButton(
                                padding: EdgeInsets.all(10),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/quanly");
                                },
                                icon: const Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                                //   iconSize: 20,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              const Text(
                                "Dịch vụ",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width / 5 - 20,
                          //   height: 100,
                          child: Column(
                            children: [
                              IconButton(
                                padding: EdgeInsets.all(10),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/quanly");
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.shareNodes,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              const Text(
                                "Biểu mẫu",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width / 5 - 20,
                          //   height: 100,
                          child: Column(
                            children: [
                              IconButton(
                                padding: EdgeInsets.all(10),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/quanly");
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.phone,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              const Text(
                                "Liên hệ",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Tin tức",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  TextButton(
                                      //   style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.transparent,
                                      //     foregroundColor: Colors.black,
                                      //     elevation: 0,
                                      //   ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/quanly");
                                      },
                                      child: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              "Xem thêm",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.orange),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14,
                                            color: Colors.orange,
                                          )
                                        ],
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 1)),
                            ),
                            child: NewsManagement(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Tài liệu nổi bật",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/quanly");
                                      },
                                      child: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              "Xem thêm",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.orange),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14,
                                            color: Colors.orange,
                                          )
                                        ],
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: PopularDocument(),
                        ),
                      ],
                    ),
                  ),
                ]),
              )),
        );
      },
    );
  }
}
