import 'package:flutter/material.dart';

class MediaUtils {
  final double padding;
  final double mainMaxWidth;
  final bool isLargeScreen;

  MediaUtils(
      {required this.padding,
      required this.mainMaxWidth,
      required this.isLargeScreen});

  factory MediaUtils.of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isLargeScreen = width > 600;

    double padding = 16;
    double mainMaxWidth = width;

    if (isLargeScreen) {
      padding = 24;
      mainMaxWidth = 840;
    }

    return MediaUtils(
        padding: padding,
        mainMaxWidth: mainMaxWidth,
        isLargeScreen: isLargeScreen);
  }
}
