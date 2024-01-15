import 'package:flutter/material.dart';
import '../models/book.dart';


class AddBookPage extends StatefulWidget {
  final Function(Book) onAddBook;

  AddBookPage({required this.onAddBook});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _coverImageController = TextEditingController();
  final _quantityController = TextEditingController();
  final _categoryController = TextEditingController();

  void _addBook() {
    final newBook = Book(
      title: _titleController.text,
      author: _authorController.text,
      coverImage: _coverImageController.text,
      quantity: int.tryParse(_quantityController.text) ?? 0,
      category: _categoryController.text,
    );
    widget.onAddBook(newBook);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Sách Mới'),
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
              onPressed: _addBook,
              child: Text('Thêm Sách'),
            ),
          ],
        ),
      ),
    );
  }
}