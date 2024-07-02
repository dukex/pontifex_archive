import 'package:flutter/material.dart';

class MediaUtils {
  final double padding;
  final double mainMaxWidth;

  MediaUtils({required this.padding, required this.mainMaxWidth});

  static of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    double padding = 16;
    double mainMaxWidth = width;

    if (width > 600) {
      padding = 24;
      mainMaxWidth = 840;
    }

    return MediaUtils(padding: padding, mainMaxWidth: mainMaxWidth);
  }
}
