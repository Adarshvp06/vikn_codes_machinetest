import 'package:flutter/material.dart';

import 'package:vikn_codes_machinetest/view/features/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:vikn_codes_machinetest/view_model/model_providers/login_provider,dart';
import 'package:vikn_codes_machinetest/view_model/ui_providers/bottomnav_provider.dart';

import 'package:vikn_codes_machinetest/view_model/ui_providers/filterscreen_provider.dart';
import 'package:vikn_codes_machinetest/view_model/ui_providers/obscure_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ObscureProvider()),
        ChangeNotifierProvider(create: (_) => FilterscreenProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
