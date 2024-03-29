import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/models/book.dart';
import 'package:untitled4/models/user_interface.dart';

class ReturnBook extends StatefulWidget {
  const ReturnBook({Key? key}) : super(key: key);
  @override
  _ReturnBookState createState() => _ReturnBookState();
}

class _ReturnBookState extends State<ReturnBook> {
  List<Book> borrowedBooks = [
    Book(
        title: 'Lập Trình Flutter',
        coverImage:
            'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
        author: '',
        quantity: 10,
        category: 'Kỹ thuật phần mềm',
        borrowedDate: DateTime.parse('2021-10-10')),
    Book(
        title: 'Lập Trình Flutter',
        coverImage:
            'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
        author: '',
        quantity: 10,
        category: 'Kỹ thuật phần mềm',
        borrowedDate: DateTime.parse('2021-10-10')),
    Book(
        title: 'Lập Trình Flutter',
        coverImage:
            'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
        author: '',
        quantity: 10,
        category: 'Kỹ thuật phần mềm',
        borrowedDate: DateTime.parse('2021-10-10')),
    Book(
        title: 'Lập Trình Flutter',
        coverImage:
            'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
        author: '',
        quantity: 10,
        category: 'Kỹ thuật phần mềm',
        borrowedDate: DateTime.parse('2021-10-10')),
    Book(
        title: 'Lập Trình Flutter',
        coverImage:
            'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
        author: '',
        quantity: 10,
        category: 'Kỹ thuật phần mềm',
        borrowedDate: DateTime.parse('2021-10-10')),
    Book(
        title: 'Lập Trình Flutter',
        coverImage:
            'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
        author: '',
        quantity: 10,
        category: 'Kỹ thuật phần mềm',
        borrowedDate: DateTime.parse('2021-10-10')),
    Book(
        title: 'Lập Trình Flutter',
        coverImage:
            'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
        author: '',
        quantity: 10,
        category: 'Kỹ thuật phần mềm',
        borrowedDate: DateTime.parse('2021-10-10')),
    Book(
        title: 'Lập Trình Flutter',
        coverImage:
            'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
        author: '',
        quantity: 10,
        category: 'Kỹ thuật phần mềm',
        borrowedDate: DateTime.parse('2021-10-10')),
    Book(
        title: 'Lập Trình Flutter',
        coverImage:
            'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
        author: '',
        quantity: 10,
        category: 'Kỹ thuật phần mềm',
        borrowedDate: DateTime.parse('2021-10-10')),
    Book(
        title: 'Lập Trình Flutter',
        coverImage:
            'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
        author: '',
        quantity: 10,
        category: 'Kỹ thuật phần mềm',
        borrowedDate: DateTime.parse('2021-10-10')),
  ];

  var selectedBook;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Trả sách',
            style: TextStyle(
                color: value.isDarkMode ? Colors.white : Colors.black),
          ),
          iconTheme: IconThemeData(
              color: value.isDarkMode ? Colors.white : Colors.black),
          backgroundColor: value.appBarColor,
        ),
        body: Container(
          // height: MediaQuery.of(context).size.height,
          color: value.isDarkMode ? Colors.grey : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        children: [
                      const TextSpan(text: 'Số sách đã mượn: '),
                      TextSpan(
                          text: '${borrowedBooks.length}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: ' quyển')
                    ])),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: borrowedBooks.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultTextStyle(
                                style: TextStyle(
                                    color: value.isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Tên sách: ${borrowedBooks[index].title}'),
                                    Text(
                                        'Thể loại: ${borrowedBooks[index].category}'),
                                    Text(
                                        'Ngày mượn: ${DateFormat('dd/MM/yyyy').format(borrowedBooks[index].borrowedDate as DateTime)}')
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.blue),
                                onPressed: () {
                                  setState(() {
                                    selectedBook = borrowedBooks[index];
                                  });
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Trả sách'),
                                      content: Text(
                                          'Bạn có muốn trả sách "${selectedBook.title}"?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Không',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              borrowedBooks.removeAt(index);
                                              selectedBook = null;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.blue),
                                          ),
                                          child: const Text('Có',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Trả sách'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
