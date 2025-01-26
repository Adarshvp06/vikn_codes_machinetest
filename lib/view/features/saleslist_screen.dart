import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_machinetest/constants/sizedbox/sizedbox.dart';
import 'package:vikn_codes_machinetest/constants/text/customtext.dart';
import 'package:vikn_codes_machinetest/view/features/filter_screen.dart';
import 'package:vikn_codes_machinetest/view/widgets/custom_widgets/custom_button.dart';
import 'package:vikn_codes_machinetest/view/widgets/custom_widgets/custom_sales_listtile.dart';

class SaleslistScreen extends StatelessWidget {
  const SaleslistScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          data: 'Invoices',
          fontsize: 16,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(
              thickness: 1,
              color: Color(0xff1C3347),
            ),
            sbheight(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: 240,
                      decoration: BoxDecoration(
                          color: const Color(0xff08131E),
                          border:
                              Border.all(width: 1, color: const Color(0xff1C3347)),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 12),
                            border: InputBorder.none,
                            prefixIcon: Image.asset(
                              'assets/icon_search...png',
                              height: 20,
                              width: 20,
                            ),
                            hintText: 'Search',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff8A8A8A))),
                      ),
                    ),
                  ),
                  Sizebox.normalwidthbox,
                  Expanded(
                    child: CustomButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (cxt) {
                            return const FilterScreen();
                          }));
                        },
                        height: 50,
                        width: 143,
                        content: Row(
                          children: [
                            Image.asset(
                              'assets/icon_filter.png',
                              height: 12,
                              width: 18,
                            ),
                            Sizebox.normalwidthbox,
                            CustomText(
                              data: 'Add Filters',
                              fontweight: FontWeight.w400,
                            )
                          ],
                        ),
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            backgroundColor:
                                const WidgetStatePropertyAll(Color(0xff1B2B30)))),
                  )
                ],
              ),
            ),
            sbheight(5),
            const Divider(
              thickness: 1,
              color: Color(0xff1C3347),
            ),
            Sizebox.normalheightbox,
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const CustomSalesListtile(
                    invoicenumber: 'Invoiceno',
                    customername: 'Customername',
                    payment: '1000000',
                    status: 'Payment',
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 0.5,
                    indent: 100,
                    endIndent: 100,
                    color: Color(0xff1C3347),
                  );
                },
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
