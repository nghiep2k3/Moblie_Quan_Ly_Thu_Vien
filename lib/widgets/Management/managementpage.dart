import 'dart:io';
import 'package:untitled4/widgets/Action/addbook.dart';
import 'package:untitled4/widgets/Action/editbook.dart';
import 'package:flutter/material.dart';
import '../../models/book.dart';




class ManagementPage extends StatefulWidget {
  @override
  _ManagementPage createState() => _ManagementPage();
}

class _ManagementPage extends State<ManagementPage> {
  // List<Book> borrowedBooks = [
  //   Book(
  //     title: 'Lập Trình Flutter',
  //     author: 'Nguyễn Văn A',
  //     coverImage: "https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg",
  //     quantity: 10,
  //     category: 'Kỹ thuật phần mềm',
  //   ),
  //   Book(
  //     title: 'Học Dart từ cơ bản đến nâng cao',
  //     author: 'Trần Thị B',
  //     coverImage: 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 5,
  //     category: 'Ngôn ngữ lập trình',
  //   ),
  //   Book(
  //     title: 'Học Dart từ cơ bản đến nâng cao',
  //     author: 'Trần Thị B',
  //     coverImage: 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 5,
  //     category: 'Ngôn ngữ lập trình',
  //   ),
  //   Book(
  //     title: 'Học Dart từ cơ bản đến nâng cao',
  //     author: 'Trần Thị B',
  //     coverImage: 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/06/Sach-hay.jpg',
  //     quantity: 5,
  //     category: 'Ngôn ngữ lập trình',
  //   ),
  // ]; // Danh sách sách và tài liệu

  void _addBook(Book book) {
    setState(() {
      borrowedBooks.add(book);
    });
  }

  void _editBook(Book bookToEdit) {
    // Mở trang chỉnh sửa hoặc hộp thoại với thông tin của bookToEdit
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditBookPage(
          book: bookToEdit,
          onSaved: () {
            // Hàm này sẽ được gọi sau khi sách được lưu
            setState(() {
              // Cập nhật dữ liệu trang quản lý ở đây
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalQuantity = borrowedBooks.fold(0, (sum, book) => sum + book.quantity);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quản Lý Sách và Tài Liệu'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Tổng số lượng: $totalQuantity')),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width > 600 ? 3 : 2, // Adjust the number of columns based on screen width
          childAspectRatio: (1 / 1.7), // Adjust the aspect ratio
        ),
        itemCount: borrowedBooks.length,
        itemBuilder: (context, index) {
          final book = borrowedBooks[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
            ),
            elevation: 5.0, // Card shadow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Căn chỉnh các widget con về phía bắt đầu (trái)
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 3 / 2, // Tỷ lệ cho ảnh, ví dụ 3:2
                  child: book.coverImage != ''
                      ? (book.coverImage.contains('https://')
                      ? Image.network(
                    book.coverImage,
                    width: 100,
                    height: 120,
                    fit: BoxFit.cover,
                  )
                      : Image.file(
                    File(book.coverImage),
                    width: 100,
                    height: 120,
                    fit: BoxFit.cover,
                  ))
                      : Container(
                    color: Colors.grey, // Màu nền nếu không có ảnh
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Text(
                        book.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text('Tác giả: ${book.author}'),
                      Text('Số lượng: ${book.quantity}'),
                      Text('Thể loại: ${book.category}'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _editBook(borrowedBooks[index]);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Xác nhận'),
                              content: Text('Bạn có chắc chắn muốn xóa sách này không?'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text('Hủy'),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Đóng hộp thoại mà không xóa
                                  },
                                ),
                                ElevatedButton(
                                  child: Text('Xóa'),
                                  onPressed: () {
                                    setState(() {
                                      borrowedBooks.removeAt(index); // Xóa sách tại vị trí index
                                      Navigator.of(context).pop(); // Đóng hộp thoại sau khi xóa
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddBookPage(onAddBook: _addBook),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

