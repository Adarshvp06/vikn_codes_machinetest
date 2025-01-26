import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vikn_codes_machinetest/view/features/dashboard.dart';
import 'package:vikn_codes_machinetest/view/features/navigation_screen.dart';
import 'package:vikn_codes_machinetest/view/features/notification_screen.dart';
import 'package:vikn_codes_machinetest/view/features/profile_screen.dart';
import 'package:vikn_codes_machinetest/view_model/ui_providers/bottomnav_provider.dart';

class CustomBottombar extends StatelessWidget {
  const CustomBottombar({super.key});
  @override
  Widget build(BuildContext context) {
    final bottomprovider = Provider.of<BottomNavProvider>(context);
    Widget getScreen(int index) {
      switch (index) {
        case 0:
          return const Dashboard();
        case 1:
          return const NavigationScreen();
        case 2:
          return const NotificationScreen();
        default:
          return const ProfileScreen();
      }
    }

    return Scaffold(
      body: getScreen(bottomprovider.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomprovider.currentIndex,
        onTap: (index) {
          bottomprovider.updateIndex(index);
        },
        type: BottomNavigationBarType.fixed,
       
        items: [
          BottomNavigationBarItem(
            label: '.',
            activeIcon: Image.asset('assets/icon_selectedhome.png'),
            icon: Image.asset('assets/icon_unselectedhome.png'),
          ),
          BottomNavigationBarItem(
            label: '.',
            icon: Image.asset('assets/icon_navigation.png'),
          ),
          BottomNavigationBarItem(
            label: '.',
            icon: Image.asset('assets/icon_notification.png'),
          ),
           BottomNavigationBarItem(
            label: '.',
            icon: Image.asset('assets/icon_unselectedprofile.png'),
            activeIcon: Image.asset('assets/icon_selectedprofile.png'),
          ),
        ],
      ),
    );
  }
}
