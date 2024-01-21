import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
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
        _image = XFile(newImagePath);
      });
      //   await _saveImageToFolder();
    }
  }

  void _addNews() {
    final newNews = News(
      title: _titleController.text,
      date: DateTime.now(),
      coverImage: _image?.path ?? '',
      description: _descriptionController.text,
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
                    image: FileImage(File(_image!.path)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
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
