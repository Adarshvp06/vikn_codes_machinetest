import 'package:flutter/material.dart';
import 'package:vikn_codes_machinetest/constants/colors/appcolor.dart';
import 'package:vikn_codes_machinetest/constants/sizedbox/sizedbox.dart';

class CustomComponent extends StatelessWidget {
  const CustomComponent(
      {super.key,
      this.height,
      this.color,
      required this.icon,
      this.rowwidget,
      this.containerheight,
      this.containerwidth,
      this.containerclr,
      required this.columnwidget, this.paddinggap});
  final double? height;
  final Color? color;
  final String icon;
  final Widget columnwidget;
  final Widget? rowwidget;
  final double? containerheight;
  final double? containerwidth;
  final Color? containerclr;
  final double? paddinggap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerheight ?? 107,
      width: containerwidth ?? MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33),
          color: containerclr ?? Appcolor.blackclr),
      child: Padding(
        padding:  EdgeInsets.all(paddinggap ?? 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: height ?? 78,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(111),
                      color: color ?? const Color(0xffA9C9C5)),
                  child: Image.asset(
                    icon,
                    height: 18,
                    width: 18,
                  ),
                ),
                Sizebox.normalwidthbox,
                columnwidget
              ],
            ),
             if (rowwidget != null) rowwidget!, 
               
          ],
        ),
      ),
    );
  }
}
