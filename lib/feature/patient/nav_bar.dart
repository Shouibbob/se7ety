import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/patient/home/presentation/page/appointments_view.dart';
import 'package:se7ety/feature/patient/home/presentation/page/home_view.dart';
import 'package:se7ety/feature/patient/home/presentation/page/profile_view.dart';
import 'package:se7ety/feature/patient/home/presentation/page/search_view.dart';

class PatientNavBarWidget extends StatefulWidget {
  const PatientNavBarWidget({super.key});

  @override
  State<PatientNavBarWidget> createState() => _PatientNavBarWidgetState();
}

class _PatientNavBarWidgetState extends State<PatientNavBarWidget> {
  int _selectIndex = 0;
  final List _pages = [
    const PatientHomeView(),
    const SearchView(),
    const AppointmentsView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: _pages[_selectIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: AppColors.textColor.withOpacity(.2),
            ),
          ],
        ),
        child: GNav(
          curve: Curves.easeOutExpo,
          rippleColor: AppColors.greyColor,
          hoverColor: AppColors.greyColor,
          haptic: true,
          tabBorderRadius: 20,
          gap: 5,
          activeColor: AppColors.whiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: AppColors.primaryColor,
          textStyle: getBodyStyle(color: AppColors.whiteColor),
          tabs: const [
            GButton(
              iconSize: 28,
              icon: Icons.home,
              text: 'الرئيسية',
            ),
            GButton(
              iconSize: 28,
              icon: Icons.search,
              text: 'البحث',
            ),
            GButton(
              iconSize: 28,
              icon: Icons.calendar_month_rounded,
              text: 'المواعيد',
            ),
            GButton(
              iconSize: 28,
              icon: Icons.person,
              text: 'الحساب',
            ),
          ],
          selectedIndex: _selectIndex,
          onTabChange: (value) {
            setState(() {
              _selectIndex = value;
            });
          },
        ),
      ),
    );
  }
}
