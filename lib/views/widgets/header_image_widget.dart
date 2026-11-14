import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imagePath;
  final double? height;

  const HeaderImageWidget({
    super.key,
    required this.imagePath,
    this.height = 240,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: double.infinity,
      height: height,
      fit: BoxFit.cover,
    );
  }
}