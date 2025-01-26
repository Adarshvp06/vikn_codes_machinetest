import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vikn_codes_machinetest/constants/text/customtext.dart';
import 'package:vikn_codes_machinetest/view_model/ui_providers/filterscreen_provider.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown(
      {super.key,
      required this.hinttext,
      required this.items,
      this.height,
      this.width,
      this.borderradius,
      this.borderside,});
  final Widget hinttext;
  final List<String>? items;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderradius;
  final BoxBorder? borderside;
  

  @override
  Widget build(BuildContext context) {
    final dropdownState = Provider.of<FilterscreenProvider>(context);
    return Container(
      height: height ?? 35,
      width: width ?? 138,
      decoration: BoxDecoration(
        border: borderside ?? const Border(),
        borderRadius: borderradius ?? BorderRadius.circular(41),
        color: const Color(0xFF08131E),
      ),
      child: DropdownButtonFormField<String>(
        value: dropdownState.selectedValue.isNotEmpty
            ? dropdownState.selectedValue
            : null,
        icon: Image.asset(
          'assets/icon_arrowdown.png',
          height: 12,
          width: 12,
        ),
        style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        hint: hinttext,
        items: items!.map((String choice) {
          return DropdownMenuItem(
            value: choice,
            child: CustomText(data: choice, fontweight: FontWeight.w400),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            dropdownState.setSelectedValue(value);
          }
        },
      ),
    );
  }
}
