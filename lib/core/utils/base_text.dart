import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BaseText extends StatelessWidget {
  BaseText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14,
    this.color = Colors.black,
    this.maxLines = 1,
  });
  final String text;
  FontWeight fontWeight;
  double fontSize;
  Color color;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
