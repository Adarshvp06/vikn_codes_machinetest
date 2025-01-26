import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_machinetest/constants/colors/appcolor.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.data,
      this.fontsize,
      this.fontweight,
      this.color});

  final String data;
  final double? fontsize;
  final FontWeight? fontweight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      data,
      style: GoogleFonts.poppins(
          fontSize: fontsize ?? 15,
          fontWeight: fontweight ?? FontWeight.bold,
          color: color ?? Appcolor.whiteclr),
    );
  }
}
