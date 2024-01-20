import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/news.dart';

class AddNews extends StatefulWidget {
  const AddNews({super.key, required this.onAddNews});
  final Function(News) onAddNews;
  @override
  _AddNewsState createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addNews() {
    final newNews = News(
      title: _titleController.text,
      date: DateTime.now(),
      coverImage: _image?.path ?? '',
      description: _descriptionController.text ?? '',
    );
    widget.onAddNews(newNews);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Tin Tức'),
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
                    image: FileImage(_image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            TextButton(
              onPressed: _pickImage,
              child: Text('Chọn ảnh'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Tiêu đề',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Mô tả',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addNews,
              child: Text('Thêm'),
            ),
          ],
        ),
      ),
    );
  }
}
