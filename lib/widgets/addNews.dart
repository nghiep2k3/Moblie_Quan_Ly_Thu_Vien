import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/models/user_interface.dart';
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
    return Consumer<UserInterface>(builder: (context, ui, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Thêm Tin Tức',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          backgroundColor: ui.appBarColor,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          color: ui.isDarkMode ? Colors.black : Colors.white,
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
              SizedBox(height: 15),
              TextButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        ui.isDarkMode ? Colors.white : Colors.blue),
                  ),
                  child: Text(
                    'Chọn ảnh',
                    style: TextStyle(
                        color: ui.isDarkMode ? Colors.blue : Colors.white),
                  )),
              TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Tiêu đề',
                    labelStyle: TextStyle(
                        color: ui.isDarkMode ? Colors.white : Colors.black),
                    contentPadding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                  )),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Mô tả',
                  labelStyle: TextStyle(
                      color: ui.isDarkMode ? Colors.white : Colors.black),
                  contentPadding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 10, right: 10),
                ),
              ),
              SizedBox(height: 50.0),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: _addNews,
                    child: Text(
                      'Thêm',
                      style: TextStyle(
                          color: ui.isDarkMode ? Colors.blue : Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
