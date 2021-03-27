import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagPickFn);
  final Function(File pickImage) imagPickFn;
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 60, maxWidth: 150);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagPickFn(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CircleAvatar(
        radius: 45,
        backgroundColor: Colors.grey,
        backgroundImage: _pickedImage != null ? FileImage(_pickedImage) : null,
      ),
      TextButton.icon(
        onPressed: _pickImage,
        icon: Icon(Icons.image),
        label: Text('Add an Image'),
      ),
    ]);
  }
}
