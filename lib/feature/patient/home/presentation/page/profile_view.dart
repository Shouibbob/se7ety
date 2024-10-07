import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'الحساب الشخصي',
          style: getTitleStyle(color: AppColors.whiteColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: AppColors.whiteColor,
              size: 26,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.primaryColor,
                        backgroundImage: AssetImage('assets/images/doc.png'),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor),
                            child: const Icon(
                              Icons.camera_alt,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'سيد عبد العزيز',
                        style: getTitleStyle(color: AppColors.primaryColor),
                      ),
                      Text(
                        'القاهرة',
                        style: getBodyStyle(),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Text(
                'نبذة تعريفية',
                style: getTitleStyle(color: AppColors.textColor),
              ),
              const Gap(10),
              Text(
                'لم تضاف',
                style: getBodyStyle(),
              ),
              const Gap(20),
              const Divider(),
              const Gap(20),
              Text(
                'معلومات التواصل',
                style: getTitleStyle(color: AppColors.textColor),
              ),
              const Gap(10),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 17,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.mail,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        const Gap(10),
                        Text(
                          'a@1.com',
                          style: getBodyStyle(),
                        ),
                      ],
                    ),
                    const Gap(13),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 17,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.call,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        const Gap(10),
                        Text(
                          '01092563383',
                          style: getBodyStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              const Gap(20),
              Text(
                'حجوزاتي',
                style: getTitleStyle(
                  color: AppColors.textColor,
                ),
              ),
              const Gap(20),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'لا يوجد حجوزات سابقة',
                  style: getBodyStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
