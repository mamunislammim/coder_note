import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, required this.title, this.maxLine, this.color, this.fw, this.fs});
  final String title;
  final int? maxLine;
  final Color? color;
  final FontWeight? fw;
  final double? fs;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine ?? 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: color ?? Colors.white, fontWeight: fw ?? FontWeight.w500, fontSize: fs ?? 15),
    );
  }
}
