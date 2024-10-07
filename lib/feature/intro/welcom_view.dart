import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/enum/user_type_enum.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/auth/presentation/page/login_view.dart';

class WelcomView extends StatelessWidget {
  const WelcomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome-bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          PositionedDirectional(
            top: 100,
            start: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'أهلا بيك',
                  style: getTitleStyle(fontSize: 30),
                ),
                const Gap(15),
                Text(
                  'سجل واحجز عند دكتورك وانت فالبيت',
                  style: getBodyStyle(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            left: 25,
            right: 25,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'سجل دلوقتي ك',
                    style:
                        getBodyStyle(fontSize: 18, color: AppColors.whiteColor),
                  ),
                  const Gap(40),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          push(
                              context,
                              const LoginView(
                                userType: UserType.doctor,
                              ));
                        },
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: AppColors.accentColor.withOpacity(.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'دكتور',
                              style: getTitleStyle(color: AppColors.textColor),
                            ),
                          ),
                        ),
                      ),
                      const Gap(15),
                      GestureDetector(
                        onTap: () {
                          push(
                              context,
                              const LoginView(
                                userType: UserType.patient,
                              ));
                        },
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: AppColors.accentColor.withOpacity(.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'مريض',
                              style: getTitleStyle(color: AppColors.textColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
