import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button_widget.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({super.key});

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'مواعيد الحجز',
          style: getTitleStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container(
              //   margin: const EdgeInsets.all(20),
              //   child: Text(
              //     'لا توجد مواعيد حتي الان',
              //     style: getBodyStyle(),
              //   ),
              // ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'د.علي زين خالد',
                            style: getTitleStyle(color: AppColors.primaryColor),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_up,
                              color: AppColors.primaryColor,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: AppColors.primaryColor,
                            ),
                            const Gap(10),
                            Text(
                              '23-11-2023',
                              style: getBodyStyle(),
                            ),
                          ],
                        ),
                        const Gap(40),
                        Text(
                          'اليوم',
                          style: getTitleStyle(color: AppColors.secondryColor),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: AppColors.primaryColor,
                        ),
                        const Gap(10),
                        Text(
                          '04:00',
                          style: getBodyStyle(),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Text(
                      'اسم المريض:سيد عبد العزيز',
                      style: getBodyStyle(),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.primaryColor,
                        ),
                        const Gap(8),
                        Text(
                          '23 شارع الجامعة,مدينة نصر,القاهرة',
                          style: getBodyStyle(),
                        ),
                      ],
                    ),
                    const Gap(30),
                    CustomButton(
                      onPressed: () {},
                      text: 'حذف الحجز',
                      color: AppColors.redColor,
                      textStyle: getBodyStyle(color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
