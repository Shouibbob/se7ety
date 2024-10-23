import 'package:flutter/material.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/services/local_storage.dart';
//import 'package:se7ety/feature/auth/presentation/page/doctor_data.dart';
import 'package:se7ety/feature/intro/onboarding/onboarding_view.dart';
import 'package:se7ety/feature/intro/welcom_view.dart';
import 'package:se7ety/feature/patient/nav_bar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    String? isLoggedIn =
        AppLocalStorage.getData(key: AppLocalStorage.userToken);
    Future.delayed(const Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        pushReplacement(context, const PatientNavBarWidget());
      } else {
        if (AppLocalStorage.getData(key: AppLocalStorage.isOnboardingSeen) ??
            false) {
          pushReplacement(context, const WelcomView());
        } else {
          pushReplacement(context, const OnboardingView());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
