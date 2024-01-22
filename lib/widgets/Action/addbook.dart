import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/book.dart';
import 'dart:io';

class AddBookPage extends StatefulWidget {
  final Function(Book) onAddBook;

  AddBookPage({required this.onAddBook});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _quantityController = TextEditingController();
  final _categoryController = TextEditingController();
  final _coverImageController =
      TextEditingController(); // Used if you need to manually input the image URL
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource media) async {
    final pickedFile = await _picker.pickImage(source: media);
    if (pickedFile != null) {
      final dir = await getApplicationDocumentsDirectory();
      final newImagePath =
          '${dir.path}/images/news/${DateTime.now().microsecondsSinceEpoch}.png';
      final imageDir = Directory('${dir.path}/images/news');
      if (!imageDir.existsSync()) {
        imageDir.createSync(recursive: true);
      }
      final File newImage = await File(pickedFile.path).copy(newImagePath);
      setState(() {
        _image = XFile(newImagePath) ;
      });
      //   await _saveImageToFolder();
    }
  }

  void _addBook() {
    final newBook = Book(
      title: _titleController.text,
      author: _authorController.text,
      coverImage: _image?.path ?? '', // Using the selected image path
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_image != null)
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(_image!.path)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              child: Text('Chọn Ảnh Bìa'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Tên sách',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(
                labelText: 'Tác giả',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: 'Số lượng',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: 'Thể loại',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
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
