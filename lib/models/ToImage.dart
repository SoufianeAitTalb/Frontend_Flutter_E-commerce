import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:e_commerce/models/task.dart';

class toImage {
  Future<Image> tr(Task task) async {
    Uint8List _bytesImage;

    _bytesImage = await Base64Decoder().convert(task.image);

    Image _myFile = Image.memory(_bytesImage);
    return _myFile;
  }
}
