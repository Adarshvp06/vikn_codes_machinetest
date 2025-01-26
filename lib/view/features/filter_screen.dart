import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:vikn_codes_machinetest/constants/colors/appcolor.dart';
import 'package:vikn_codes_machinetest/constants/sizedbox/sizedbox.dart';
import 'package:vikn_codes_machinetest/constants/text/customtext.dart';
import 'package:vikn_codes_machinetest/view/widgets/custom_widgets/custom_button.dart';
import 'package:vikn_codes_machinetest/view/widgets/custom_widgets/custom_datepicker.dart';
import 'package:vikn_codes_machinetest/view/widgets/custom_widgets/custom_dropdown.dart';
import 'package:vikn_codes_machinetest/view_model/ui_providers/filterscreen_provider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dateitems = [
      'This Month',
      'This Day',
      'This Year',
      'Customize'
    ];
    final List<String> salesdataitems = [
      'Customer1',
      'Customer2',
      'Customer3',
      'Customer4'
    ];

    final provider = Provider.of<FilterscreenProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              size: 24,
            )),
        title: CustomText(
          data: 'Filters',
          fontsize: 16,
        ),
        actions: [
          Icon(
            Icons.visibility_outlined,
            color: Appcolor.primaryclr,
            size: 26,
          ),
          sbwidth(30),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomText(
              data: 'Filter',
              color: Appcolor.primaryclr,
              fontsize: 14,
              fontweight: FontWeight.w400,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          const Divider(
            thickness: 1,
            color: Color(0xff1C3347),
          ),
          Sizebox.normalheightbox,
          CustomDropdown(
              hinttext:
                  CustomText(data: 'This Month', fontweight: FontWeight.w400),
              items: dateitems),
          Sizebox.normalheightbox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomDatepicker(),
              Sizebox.normalwidthbox,
              const CustomDatepicker()
            ],
          ),
          Sizebox.normalheightbox,
          const Divider(
            thickness: 1,
            color: Color(0xff1C3347),
          ),
          Sizebox.normalheightbox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                      onPressed: () {
                        provider.togglepress();
                      },
                      content: CustomText(
                        data: 'Pending',
                        fontweight: FontWeight.w400,
                      ),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              provider.onpressed
                                  ? Appcolor.primaryclr
                                  : const Color(0xff1B2B30)),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))))),
                ),
                Sizebox.normalwidthbox,
                Expanded(
                  child: CustomButton(
                      onPressed: () {
                        provider.togglepress();
                      },
                      content: CustomText(
                        data: 'Invoiced',
                        fontweight: FontWeight.w400,
                      ),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              provider.onpressed
                                  ? Appcolor.primaryclr
                                  : const Color(0xff1B2B30)),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))))),
                ),
                Sizebox.normalwidthbox,
                Expanded(
                  child: CustomButton(
                      onPressed: () {
                        provider.togglepress();
                      },
                      content: CustomText(
                        data: 'Cancelled',
                        fontsize: 14,
                        fontweight: FontWeight.w400,
                      ),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              provider.onpressed
                                  ? Appcolor.primaryclr
                                  : const Color(0xff1B2B30)),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))))),
                )
              ],
            ),
          ),
          Sizebox.mediumheightbox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color((0xff1C3347))),
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF08131E),
              ),
              child: DropdownButtonFormField<String>(
                value: provider.saleselectedValue.isNotEmpty
                    ? provider.saleselectedValue
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
                hint: CustomText(
                  data: 'Customer',
                  fontweight: FontWeight.w400,
                  color: const Color(0xffAEAEAE),
                ),
                items: salesdataitems.map((String saleschoice) {
                  return DropdownMenuItem(
                    value: saleschoice,
                    child: CustomText(
                        data: saleschoice, fontweight: FontWeight.w400),
                  );
                }).toList(),
                onChanged: (value1) {
                  if (value1 != null) {
                    provider.salesSelectedValue(value1);
                  }
                },
              ),
            ),
          ),
          Sizebox.mediumheightbox,
          const Divider(
            thickness: 1,
            color: Color(0xff1C3347),
          ),
        ],
      )),
    );
  }
}
