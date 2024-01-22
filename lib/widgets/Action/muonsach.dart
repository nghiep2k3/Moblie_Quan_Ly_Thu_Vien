import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/models/book.dart';
import 'package:untitled4/models/user_interface.dart';

class Muonsach extends StatefulWidget {
  const Muonsach({Key? key}) : super(key: key);

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<Muonsach> {
  bool successMessageShown = false;
  var searchQuery = " ";
  bool isDarkMode = false; // Thêm thuộc tính isDarkMode
  
  // List<Book> borrowedBooks = [
  //   Book(
  //     title: 'Lập Trình Flutter',
  //     author: 'Nguyễn Văn A',
  //     coverImage:
  //         'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 10,
  //     category: 'Kỹ thuật phần mềm',
  //   ),
  //   Book(
  //     title: 'Học Dart từ cơ bản đến nâng cao',
  //     author: 'Trần Thị B',
  //     coverImage:
  //         'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 5,
  //     category: 'Ngôn ngữ lập trình',
  //   ),
  //   Book(
  //     title: 'Học Dart từ cơ bản đến nâng cao 2',
  //     author: 'Trần Thị B',
  //     coverImage:
  //         'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 5,
  //     category: 'Ngôn ngữ lập trình',
  //   ),
  //   Book(
  //     title: 'Học Dart từ cơ bản đến nâng cao 3',
  //     author: 'Trần Thị B',
  //     coverImage:
  //         'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 5,
  //     category: 'Ngôn ngữ lập trình',
  //   ),
  //   Book(
  //     title: 'Lập Trình Flutter',
  //     author: 'Nguyễn Văn A',
  //     coverImage:
  //         'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 10,
  //     category: 'Kỹ thuật phần mềm',
  //   ),
  //   Book(
  //     title: 'Học Dart từ cơ bản đến nâng cao',
  //     author: 'Trần Thị B',
  //     coverImage:
  //         'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 5,
  //     category: 'Ngôn ngữ lập trình',
  //   ),
  //   Book(
  //     title: 'Học Dart từ cơ bản đến nâng cao 2',
  //     author: 'Trần Thị B',
  //     coverImage:
  //         'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 5,
  //     category: 'Ngôn ngữ lập trình',
  //   ),
  //   Book(
  //     title: 'Học Dart từ cơ bản đến nâng cao 3',
  //     author: 'Trần Thị B',
  //     coverImage:
  //         'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 5,
  //     category: 'Ngôn ngữ lập trình',
  //   ),
  // ];

  // hiển thị tb
  void _showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Mượn sách thành công'),
        duration: Duration(seconds: 2),
      ),
    );
    successMessageShown = true;
  }

  List<Book> results = [];

  @override
  void initState() {
    super.initState();
    results = borrowedBooks;
  }

  Future<void> _showDialog(Book selectedBook) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController idCardController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController bookCodeController = TextEditingController();

    // thông tin từ đây gửi sang bên info.dart

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Thông tin mượn sách')),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Tên người mượn',
                  ),
                ),
                TextField(
                  controller: idCardController,
                  decoration: const InputDecoration(labelText: 'Số căn cước'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Số điện thoại'),
                ),
                TextField(
                  controller: bookCodeController,
                  decoration: const InputDecoration(labelText: 'Mã sách'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                Provider.of<UserInterface>(context, listen: false).addBorrower(
                  name: nameController.text,
                  idCard: idCardController.text,
                  phone: phoneController.text,
                  bookCode: bookCodeController.text,
                );
                // Process the entered information, e.g., print or save to a database
                print('Tên: ${nameController.text}');
                print('Số căn cước: ${idCardController.text}');
                print('Số điện thoại: ${phoneController.text}');
                print('Mã sách: ${bookCodeController.text}');

                // Decrease the quantity of the selected book by 1
                setState(() {
                  selectedBook.quantity -= 1;
                });
                _showSuccessSnackBar();
                Navigator.of(context).pop();
              },
              child: const Text('Mượn sách'),
            ),
          ],
        );
      },
    );
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Mượn sách'),
  //       centerTitle: true,
  //       backgroundColor: Colors.purple,
  //     ),
  //     body: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: TextField(
  //             onChanged: (value) {
  //               setState(() {
  //                 searchQuery = value;
  //                 if (searchQuery.isEmpty) {
  //                   results = borrowedBooks;
  //                 } else {
  //                   results = borrowedBooks
  //                       .where((book) => book.title
  //                           .toLowerCase()
  //                           .contains(searchQuery.toLowerCase()))
  //                       .toList();
  //                 }
  //               });
  //             },
  //             decoration: InputDecoration(
  //               labelText: 'Tìm kiếm',
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(12.0),
  //               ),
  //               prefixIcon: const Icon(Icons.search),
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           child: ListView.builder(
  //             itemBuilder: (BuildContext context, int index) {
  //               var item = results[index];
  //               return ListTile(
  //                 title: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       item.title,
  //                       style: const TextStyle(
  //                         color: Colors.red,
  //                         fontSize: 18,
  //                         fontFamily: 'nexaRegular',
  //                       ),
  //                     ),
  //                     Text(
  //                       'Số lượng: ${item.quantity}',
  //                       style: const TextStyle(
  //                         color: Colors.black,
  //                         fontSize: 14,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 trailing: ElevatedButton(
  //                   onPressed: () {
  //                     _showDialog(item);
  //                   },
  //                   child: const Text('Mượn sách'),
  //                 ),
  //               );
  //             },
  //             itemCount: results.length,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(builder: (context, ui, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mượn sách'),
          centerTitle: true,
          backgroundColor: ui.appBarColor,
        ),
        body: Container(
          color:
              ui.isDarkMode ? const Color.fromARGB(255, 0, 0, 0) : Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                      if (searchQuery.isEmpty) {
                        results = borrowedBooks;
                      } else {
                        results = borrowedBooks
                            .where((book) => book.title
                                .toLowerCase()
                                .contains(searchQuery.toLowerCase()))
                            .toList();
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Tìm kiếm',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    var item = results[index];
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              color:
                                  ui.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 18,
                              fontFamily: 'nexaRegular',
                            ),
                          ),
                          Text(
                            'Số lượng: ${item.quantity}',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _showDialog(item);
                        },
                        child: const Text('Mượn sách'),
                      ),
                    );
                  },
                  itemCount: results.length,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
