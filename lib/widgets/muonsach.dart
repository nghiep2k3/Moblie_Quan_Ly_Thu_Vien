import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_interface.dart';
import '../models/book.dart';

class Muonsach extends StatelessWidget {
  const Muonsach({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Mượn sách"),
            backgroundColor: ui.appBarColor,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: MySearchApp(),
              ),
              Expanded(
                child: Container(
                  height: 1000,
                  color: Colors.white,
                  child: BookList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MySearchApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MySearchAppState();
  }
}

class _MySearchAppState extends State<MySearchApp> {
  final TextEditingController _controller = TextEditingController();
  List<Book> books = [
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
      title: 'Học Dart từ cơ bản đến nâng cao',
      author: 'Trần Thị B',
      coverImage:
          'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
      quantity: 5,
      category: 'Ngôn ngữ lập trình',
    ),
    Book(
      title: 'Học Dart từ cơ bản đến nâng cao',
      author: 'Trần Thị B',
      coverImage:
          'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
      quantity: 5,
      category: 'Ngôn ngữ lập trình',
    ),
  ]; // Danh sách sách và
  List<String> ketQuaTimKiem = [];
  String inputData = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            onChanged: (value) {
              print("Dữ liệu từ ô tìm kiếm: $value");
            },
            decoration: const InputDecoration(
              labelText: 'Tìm kiếm',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: ketQuaTimKiem.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${ketQuaTimKiem[index]}"),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BookList extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Lập Trình Flutter',
      author: 'Nguyễn Văn A',
      coverImage:
          'https://cdn.alongwalk.info/vn/wp-content/uploads/2022/09/28150737/image-69-hinh-anh-gai-xinh-trung-quoc-hot-girl-trung-quoc-dep-nhat-2022-166432725635319.jpg',
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
      title: 'Học Dart từ cơ bản đến nâng cao',
      author: 'Trần Thị B',
      coverImage:
          'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
      quantity: 5,
      category: 'Ngôn ngữ lập trình',
    ),
    Book(
      title: 'Học Dart từ cơ bản đến nâng cao',
      author: 'Trần Thị B',
      coverImage:
          'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
      quantity: 5,
      category: 'Ngôn ngữ lập trình',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 100,
          child: ListTile(
            leading: Image.network(
              books[index].coverImage,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(books[index].title),
            subtitle: Row(
              children: [
                Text(books[index].author),
                // Text('Số lượng: ${books[index].quantity}'),
              ],
            ),
            trailing: SizedBox(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý sự kiện khi nút được nhấn
                      print('Mượn sách: ${books[index].title}');
                    },
                    child: Text("Mượn sách"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
