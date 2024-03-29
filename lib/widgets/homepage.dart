import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled4/models/news.dart';
import 'package:untitled4/widgets/components/news_list.dart';
import 'package:untitled4/widgets/components/popular_document.dart';

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
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              backgroundColor: ui.appBarColor,
              iconTheme: IconThemeData(color: Colors.white)),
          drawer: MyDrawer(),
          body: DefaultTextStyle.merge(
            style: TextStyle(
              fontSize: ui.fontSize,
              color: ui.isDarkMode ? Colors.white : Colors.black,
            ),
            child: Container(
                color: ui.isDarkMode
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : Colors.white,
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    SizedBox(
                      //   width: 100,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Tìm kiếm",
                            prefixIcon: Icon(
                              Icons.search,
                              color:
                                  ui.isDarkMode ? Colors.white : Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color:
                                    ui.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            labelStyle: TextStyle(
                              color:
                                  ui.isDarkMode ? Colors.white : Colors.black,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                        cursorColor:
                            ui.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width / 5 - 15,
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
                                // SizedBox(
                                //   height: 20,
                                // ),
                                const Text(
                                  "Giới thiệu",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width / 5 - 20,
                            //   height: 100,
                            child: Column(
                              // mainAxisSize: MainAxisSize.max,
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
                                  style: TextStyle(fontSize: 10),
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
                                  style: TextStyle(fontSize: 10),
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
                                  style: TextStyle(fontSize: 10),
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
                                  style: TextStyle(fontSize: 10),
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
                                          Navigator.pushNamed(
                                              context, "/quanly_tintuc");
                                        },
                                        child: const Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
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
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 1)),
                              ),
                              child: NewsList(),
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
                                          Navigator.pushNamed(
                                              context, "/quanly");
                                        },
                                        child: const Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
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
          ),
        );
      },
    );
  }
}
