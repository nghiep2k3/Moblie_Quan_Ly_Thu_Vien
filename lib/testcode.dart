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
      appBar: AppBar(title: Text('Searchable Text Example')),
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
                    // If search query is not empty, filter books
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
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var item = results[index];
                return ListTile(
                  title: Text(
                    item.title, // Use Text widget instead of SearchableText
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 11,
                      fontFamily: 'nexaRegular',
                    ),
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
}
