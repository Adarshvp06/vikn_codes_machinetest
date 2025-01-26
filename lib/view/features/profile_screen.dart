import 'package:flutter/material.dart';
import 'package:vikn_codes_machinetest/constants/colors/appcolor.dart';
import 'package:vikn_codes_machinetest/constants/sizedbox/sizedbox.dart';
import 'package:vikn_codes_machinetest/constants/text/customtext.dart';
import 'package:vikn_codes_machinetest/view/data/settings_data.dart';
import 'package:vikn_codes_machinetest/view/features/login_screen.dart';
import 'package:vikn_codes_machinetest/view/widgets/custom_widgets/custom_button.dart';
import 'package:vikn_codes_machinetest/view/widgets/custom_widgets/custom_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsData settingsData = SettingsData();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Container(
              height: 360,
              decoration: BoxDecoration(
                  color: const Color(0xff0F0F0F),
                  borderRadius: BorderRadius.circular(44)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  top: 20,
                  right: 18,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/main_profile.png'),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(33),
                              ),
                            ),
                            sbwidth(20),
                            Column(
                              children: [
                                CustomText(
                                  data: 'David Arnold',
                                  fontsize: 20,
                                ),
                                CustomText(
                                  data: 'david012@cabzing',
                                  fontsize: 14,
                                  fontweight: FontWeight.w400,
                                  color: const Color(0xffB5CDFE),
                                ),
                              ],
                            )
                          ],
                        ),
                        Image.asset(
                          'assets/icon_edit.png',
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                    Sizebox.mediumheightbox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomComponent(
                            containerwidth: MediaQuery.sizeOf(context).width,
                            icon: 'assets/icon_stars.png',
                            color: const Color(0xffB5CDFE),
                            columnwidget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      data: '4.3',
                                      fontsize: 18,
                                      fontweight: FontWeight.w400,
                                    ),
                                    sbwidth(5),
                                    Image.asset('assets/icon_starfilled.png')
                                  ],
                                ),
                                CustomText(
                                  data: '2.28',
                                  fontsize: 14,
                                  fontweight: FontWeight.w400,
                                  color: const Color(0xff565656),
                                ),
                                CustomText(
                                  data: 'rides',
                                  fontsize: 14,
                                  fontweight: FontWeight.w400,
                                  color: const Color(0xffB5CDFE),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Sizebox.normalwidthbox,
                        Expanded(
                          child: CustomComponent(
                            containerwidth: MediaQuery.sizeOf(context).width,
                            icon: 'assets/icon_kyc.png',
                            columnwidget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      data: 'KYC',
                                      fontsize: 18,
                                      fontweight: FontWeight.w400,
                                    ),
                                    sbwidth(5),
                                    Image.asset('assets/icon_verified.png')
                                  ],
                                ),
                                CustomText(
                                  data: 'Verified',
                                  fontweight: FontWeight.w400,
                                  color: const Color(0xffA9C9C5),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Sizebox.mediumheightbox,
                    CustomButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }));
                        },
                        height: 67,
                        width: MediaQuery.sizeOf(context).width,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_logout.png',
                              height: 24,
                              width: 24,
                            ),
                            sbwidth(5),
                            CustomText(
                              data: 'Logout',
                              color: const Color(0xffEA6262),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Appcolor.blackclr),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(174)))))
                  ],
                ),
              ),
            ),
            Sizebox.mediumheightbox,
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: Image.asset(
                        settingsData.icons[index],
                        height: 24,
                        width: 24,
                      ),
                      title: CustomText(
                        data: settingsData.data[index],
                        fontweight: FontWeight.w400,
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 18,
                            color: Appcolor.whiteclr,
                          )));
                },
                itemCount: settingsData.data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Sizebox.normalheightbox;
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
