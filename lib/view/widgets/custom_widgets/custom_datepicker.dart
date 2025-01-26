import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vikn_codes_machinetest/constants/colors/appcolor.dart';
import 'package:vikn_codes_machinetest/constants/sizedbox/sizedbox.dart';
import 'package:vikn_codes_machinetest/constants/text/customtext.dart';
import 'package:vikn_codes_machinetest/view_model/ui_providers/filterscreen_provider.dart';

class CustomDatepicker extends StatelessWidget {
  const CustomDatepicker({super.key});

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<FilterscreenProvider>(context);

    return GestureDetector(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: dateProvider.selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          dateProvider.setDate(pickedDate);
        }
      },
      child: Container(
          height: 38,
          width: 148,
          decoration: BoxDecoration(
              color: Color(0xff1B2B30),
              borderRadius: BorderRadius.circular(24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: Appcolor.primaryclr,
                size: 24,
              ),
              Sizebox.normalwidthbox,
              CustomText(
                data:
                    DateFormat('dd/MM/yyyy').format(dateProvider.selectedDate),
                fontweight: FontWeight.w400,
              ),
            ],
          )),
    );
  }
}
