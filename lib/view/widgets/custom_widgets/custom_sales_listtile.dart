import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_machinetest/constants/text/customtext.dart';

class CustomSalesListtile extends StatelessWidget {
  const CustomSalesListtile(
      {super.key,
      this.invoicenumber,
      this.customername,
      this.status,
      this.payment});

  final String? invoicenumber;
  final String? customername;
  final String? status;
  final String? payment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // title: CustomText(data: '#Invoice No'),
      title: RichText(
          text: TextSpan(
              style: GoogleFonts.poppins(
                  fontSize: 13, fontWeight: FontWeight.w400),
              children: [
            const TextSpan(text: '#', style: TextStyle(color: Color(0xff7D7D7D))),
            TextSpan(
                text: invoicenumber ?? '',
                style: const TextStyle(color: Color(0xffB5CDFE)))
          ])),
      subtitle: CustomText(
        data: customername ?? 'Unknown',
        fontsize: 14,
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText(
              data: status ?? '',
              fontsize: 13,
              fontweight: FontWeight.w400,
            ),
            RichText(
                text: TextSpan(
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                    children: [
                  const TextSpan(
                      text: 'SAR',
                      style: TextStyle(color: Color(0xff888888), fontSize: 12)),
                  const TextSpan(text: ' '),
                  TextSpan(
                      text: payment ?? '',
                      style: const TextStyle(color: Color(0xffB5CDFE), fontSize: 14))
                ])),
          ],
        ),
      ),
      
    );
  }
}
