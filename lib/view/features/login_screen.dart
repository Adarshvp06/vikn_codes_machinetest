import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vikn_codes_machinetest/constants/colors/appcolor.dart';
import 'package:vikn_codes_machinetest/constants/sizedbox/sizedbox.dart';
import 'package:vikn_codes_machinetest/constants/text/customtext.dart';
import 'package:vikn_codes_machinetest/view/widgets/custom_widgets/custom_bottombar.dart';
import 'package:vikn_codes_machinetest/view/widgets/custom_widgets/custom_button.dart';
import 'package:vikn_codes_machinetest/view_model/model_providers/login_provider,dart';
import 'package:vikn_codes_machinetest/view_model/ui_providers/obscure_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obscureProvider = Provider.of<ObscureProvider>(context);
    final key = GlobalKey<FormState>();
    final loginprovider = Provider.of<LoginProvider>(context);
    final usernamecontroller = TextEditingController();
    final passwordcontroller = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: key,
          child: Container(
            decoration: BoxDecoration(color: Appcolor.blackclr,
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/loginscreen_bg.png',
                    ),
                    fit: BoxFit.fill)
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/icon_language.png'),
                      sbwidth(5),
                      CustomText(
                        data: 'English',
                        fontsize: 14,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CustomText(
                        data: 'Login',
                        fontsize: 21,
                      ),
                      CustomText(
                        data: 'Login to your vikn account',
                        color: Appcolor.textclr,
                      ),
                      Sizebox.largeheightbox,
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff1C3347), width: 1),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        height: 60,
                        width: MediaQuery.sizeOf(context).width,
                        child: TextFormField(
                          controller: usernamecontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field should not be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Username',
                              labelStyle: GoogleFonts.poppins(
                                  color: Appcolor.textclr, fontSize: 14),
                              prefixIcon: Image.asset(
                                'assets/icon_user.png',
                                width: 24,
                                height: 24,
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff1C3347), width: 1),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        height: 60,
                        width: MediaQuery.sizeOf(context).width,
                        child: TextFormField(
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field should not be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Password',
                              labelStyle: GoogleFonts.poppins(
                                  color: Appcolor.textclr, fontSize: 14),
                              prefixIcon: Image.asset(
                                'assets/icon_password.png',
                                width: 24,
                                height: 24,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    obscureProvider.toggleobscure();
                                  },
                                  icon: Icon(
                                    color: Appcolor.primaryclr,
                                    size: 24,
                                    obscureProvider.isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ))),
                        ),
                      ),
                      Sizebox.largeheightbox,
                      CustomText(
                        data: 'Forgotten Password?',
                        color: Appcolor.primaryclr,
                        fontweight: FontWeight.w400,
                      ),
                      sbheight(40),
                      CustomButton(
                        content: Row(
                          children: [
                            CustomText(
                              data: 'Sign in',
                              fontweight: FontWeight.w400,
                            ),
                            sbwidth(7),
                            Icon(
                              Icons.arrow_forward_outlined,
                              color: Appcolor.whiteclr,
                              size: 24,
                            )
                          ],
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Appcolor.primaryclr),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(120)))),
                        onPressed: () {
                          final username = usernamecontroller.text.trim();
                          final password = passwordcontroller.text.trim();
                          if (key.currentState!.validate()) {
                            loginprovider.login(usernamecontroller.text,
                                passwordcontroller.text);
                          }
                          if (username.isNotEmpty && password.isNotEmpty) {
                            loginprovider.login(username, password);
                            if (loginprovider.errorMessage == null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => const CustomBottombar(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text(loginprovider.errorMessage ?? ''),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: CustomText(
                                  color: Appcolor.blackclr,
                                  data: 'Please fill all fields',
                                ),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        CustomText(
                          data: 'Don’t have an Account?',
                          fontweight: FontWeight.w400,
                        ),
                        sbheight(5),
                        CustomText(
                          data: 'Sign up now!',
                          fontsize: 16,
                          color: Appcolor.primaryclr,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
