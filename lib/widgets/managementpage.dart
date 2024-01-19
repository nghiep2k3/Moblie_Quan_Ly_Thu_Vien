import 'package:untitled4/widgets/addbook.dart';
import 'package:untitled4/widgets/editbook.dart';
import '/widgets/components/my_drawer.dart';
import '/models/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';

class ManagementPage extends StatefulWidget {
  @override
  _ManagementPage createState() => _ManagementPage();
}

class _ManagementPage extends State<ManagementPage> {
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
  ]; // Danh sách sách và tài liệu

  void _addBook(Book book) {
    setState(() {
      books.add(book);
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
    int totalQuantity = books.fold(0, (sum, book) => sum + book.quantity);
    double width = MediaQuery.of(context).size.width;

    return Consumer<UserInterface>(builder: (context, ui, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ui.appBarColor,
          title: const Text('Quản Lý Sách và Tài Liệu'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Tổng số lượng: $totalQuantity')),
            ),
          ],
        ),
        body: Container(
          color: ui.isDarkMode ? Color.fromARGB(255, 0, 0, 0) : Colors.white,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width > 600
                  ? 3
                  : 2, // Adjust the number of columns based on screen width
              childAspectRatio: (1 / 1.9), // Adjust the aspect ratio
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              // Tính toán kích thước ảnh dựa trên kích thước màn hình
              double screenWidth = MediaQuery.of(context).size.width;
              double imageHeight = screenWidth /
                  3; // Ví dụ: chiều cao ảnh = 1/3 chiều rộng màn hình
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                elevation: 5.0, // Card shadow
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Căn chỉnh các widget con về phía bắt đầu (trái)
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 3 / 2, // Tỷ lệ cho ảnh, ví dụ 3:2
                      child: Image.network(
                        book.coverImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            book.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _editBook(books[index]);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Xác nhận'),
                                  content: const Text(
                                      'Bạn có chắc chắn muốn xóa sách này không?'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text('Hủy'),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Đóng hộp thoại mà không xóa
                                      },
                                    ),
                                    ElevatedButton(
                                      child: const Text('Xóa'),
                                      onPressed: () {
                                        setState(() {
                                          books.removeAt(
                                              index); // Xóa sách tại vị trí index
                                          Navigator.of(context)
                                              .pop(); // Đóng hộp thoại sau khi xóa
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddBookPage(onAddBook: _addBook),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
