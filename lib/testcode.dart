import 'package:flutter/material.dart';
import 'package:untitled4/models/book.dart';

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  var searchQuery = " ";
  List<Book> allBooks = [
    Book(
      title: 'Lập Trình Flutter',
      author: 'Nguyễn Văn A',
      coverImage:
          'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
      quantity: 10,
      category: 'Kỹ thuật phần mềm',
    ),
    Book(
      title: 'Học Dart từ cơ bản đến nâng cao',
      author: 'Trần Thị B',
      coverImage:
          'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
      quantity: 5,
      category: 'Ngôn ngữ lập trình',
    ),
    Book(
      title: 'Học Dart từ cơ bản đến nâng cao 2',
      author: 'Trần Thị B',
      coverImage:
          'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
      quantity: 5,
      category: 'Ngôn ngữ lập trình',
    ),
    Book(
      title: 'Học Dart từ cơ bản đến nâng cao 3',
      author: 'Trần Thị B',
      coverImage:
          'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
      quantity: 5,
      category: 'Ngôn ngữ lập trình',
    ),
  ];
  List<Book> results = [];

  // trạng thái ban đầu
  @override
  void initState() {
    super.initState();
    results = allBooks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mượn sách')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  if (searchQuery.isEmpty) {
                    results = allBooks;
                  } else {
                    results = allBooks
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
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontFamily: 'nexaRegular',
                        ),
                      ),
                      Text(
                        'Số lượng: ${item.quantity}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      _showDialog(); // Function to show the dialog
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
    );
  }

  // Function to show the dialog
  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Center(child: Text('Xin chào')),
          content: const Text('Chào mừng bạn đến với ứng dụng mượn sách!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}
