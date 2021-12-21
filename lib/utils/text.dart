import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double size;

  const ModifiedText({Key? key, required this.text,  this.color = Colors.white ,  this.size = 14, this.fontWeight = FontWeight.normal}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.breeSerif(color: color, fontSize: size),);
  }
}
