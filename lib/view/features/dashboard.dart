import 'package:flutter/material.dart';
import 'package:vikn_codes_machinetest/constants/colors/appcolor.dart';
import 'package:vikn_codes_machinetest/constants/sizedbox/sizedbox.dart';
import 'package:vikn_codes_machinetest/constants/text/customtext.dart';
import 'package:vikn_codes_machinetest/view/features/profile_screen.dart';
import 'package:vikn_codes_machinetest/view/features/saleslist_screen.dart';
import 'package:vikn_codes_machinetest/view/widgets/custom_widgets/custom_component.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/comapany_logo.png',
                        height: 30,
                        width: 30,
                      ),
                      sbwidth(5),
                      CustomText(
                        data: 'CabZing',
                        fontsize: 22,
                        fontweight: FontWeight.w600,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Image.asset(
                          'assets/logo2.png',
                          height: 5,
                          width: 5,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (cxt) {
                        return const ProfileScreen();
                      }));
                    },
                    child: Container(
                      height: 61,
                      width: 61,
                      decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage('assets/profile_pic (2).png'),fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(44)),
                      
                    ),
                  )
                ],
              ),
              Sizebox.normalheightbox,
              Container(
                height: 395,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: AssetImage('assets/sales_graph.png'),
                        fit: BoxFit.fill)),
              ),
              Sizebox.normalheightbox,
              CustomComponent(
                paddinggap: 20,
                containerheight: 130,
                height: 92,
                color: const Color(0xffF6EFED),
                icon: 'assets/icon_booking.png',
                columnwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      data: 'Bookings',
                      fontsize: 15,
                      fontweight: FontWeight.w400,
                      color: const Color(0xffF6EFED),
                    ),
                    CustomText(
                      data: '123',
                      fontsize: 22,
                      fontweight: FontWeight.w400,
                    ),
                    CustomText(
                      data: 'Reserved',
                      fontsize: 14,
                      fontweight: FontWeight.w400,
                      color: const Color(0xff565656),
                    )
                  ],
                ),
                rowwidget: Container(
                  height: 75,
                  width: 75,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(17)),
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    size: 24,
                    color: Appcolor.whiteclr,
                  ),
                ),
              ),
              sbheight(5),
              CustomComponent(
                paddinggap: 20,
                containerheight: 130,
                height: 92,
                icon: 'assets/icon_invoice.png',
                columnwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      data: 'Invoices',
                      fontsize: 15,
                      fontweight: FontWeight.w400,
                      color: const Color(0xffA9C9C5),
                    ),
                    CustomText(
                      data: '10,232.00',
                      fontsize: 22,
                      fontweight: FontWeight.w400,
                    ),
                    CustomText(
                      data: 'Rupees',
                      fontsize: 14,
                      fontweight: FontWeight.w400,
                      color: const Color(0xff565656),
                    )
                  ],
                ),
                rowwidget: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (cxt) {
                      return const SaleslistScreen();
                    }));
                  },
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(17)),
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      size: 24,
                      color: Appcolor.whiteclr,
                    ),
                  ),
                ),
              ),
              Sizebox.mediumheightbox
            ],
          ),
        ),
      )),
    );
  }
}
