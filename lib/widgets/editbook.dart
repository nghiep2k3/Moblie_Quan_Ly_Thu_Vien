import 'package:flutter/material.dart';
import '../models/book.dart';

class EditBookPage extends StatefulWidget {
  final Book book;
  final VoidCallback onSaved;

  EditBookPage({required this.book, required this.onSaved});

  @override
  _EditBookPageState createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _coverImageController;
  late TextEditingController _quantityController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    // Khởi tạo các controller với giá trị ban đầu từ cuốn sách cần chỉnh sửa
    _titleController = TextEditingController(text: widget.book.title);
    _authorController = TextEditingController(text: widget.book.author);
    _coverImageController = TextEditingController(text: widget.book.coverImage);
    _quantityController = TextEditingController(text: widget.book.quantity.toString());
    _categoryController = TextEditingController(text: widget.book.category);
  }

  void _saveBook() {
    // Cập nhật thông tin sách với các giá trị mới từ các controller
    setState(() {
      widget.book.title = _titleController.text;
      widget.book.author = _authorController.text;
      widget.book.coverImage = _coverImageController.text;
      widget.book.quantity = int.tryParse(_quantityController.text) ?? widget.book.quantity;
      widget.book.category = _categoryController.text;
    });
    widget.onSaved();

    Navigator.of(context).pop(); // Quay lại trang trước sau khi lưu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh Sửa Sách'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Tên sách'),
            ),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Tác giả'),
            ),
            TextField(
              controller: _coverImageController,
              decoration: InputDecoration(labelText: 'URL Ảnh bìa'),
            ),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Số lượng'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Thể loại'),
            ),
            ElevatedButton(
              onPressed: _saveBook,
              child: Text('Lưu Thay Đổi'),
            ),
          ],
        ),
      ),
    );
  }
}