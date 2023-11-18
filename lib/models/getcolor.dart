import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:e_commerce/models/task.dart';

class Coll {
  getImagePalette(Task task) async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(task.img.image);
    Color col = paletteGenerator.dominantColor!.color;
    return col;
  }
}
