import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button_widget.dart';
import 'package:se7ety/feature/patient/nav_bar.dart';

class DoctorData extends StatefulWidget {
  const DoctorData({super.key});

  @override
  State<DoctorData> createState() => _DoctorDataState();
}

class _DoctorDataState extends State<DoctorData> {
  String? path;
  String? valuesChoose;
  List listItem = [
    "جراحة عامة",
    "دكتور قلب",
    "دكتور أطفال",
    "دكتور عظام",
    "جراحة عيون",
    "دكتور النساء والتوليد",
    "دكتور باطنة",
    "دكتور أسنان",
    "أنف وأذن وحنجرة",
    "التجميلية و الترميمية",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'اكمال عملية التسجيل',
          style: getTitleStyle(color: AppColors.whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.primaryColor,
                        backgroundImage: (path != null)
                            ? FileImage(File(path ?? ''))
                            : const AssetImage('assets/images/doc.png'),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: AppColors.accentColor,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.all(20),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.accentColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Gap(20),
                                      CustomButton(
                                        onPressed: () {
                                          pickImage(true);
                                          Navigator.pop(context);
                                        },
                                        text: 'الكاميرا',
                                        width: double.infinity,
                                      ),
                                      const Gap(15),
                                      CustomButton(
                                        width: double.infinity,
                                        onPressed: () {
                                          pickImage(false);
                                          Navigator.pop(context);
                                        },
                                        text: 'المعرض',
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteColor,
                            ),
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
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'التخصص',
                      style: getBodyStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Gap(10),
                  Container(
                    height: 65,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.accentColor,
                    ),
                    child: Center(
                      child: DropdownButton(
                        hint: Text(valuesChoose ?? 'اختر التخصص'),
                        dropdownColor: AppColors.accentColor,
                        icon: const Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: AppColors.primaryColor,
                        ),
                        isExpanded: true,
                        iconSize: 33,
                        value: valuesChoose,
                        style: getBodyStyle(color: AppColors.greyColor),
                        onChanged: (newValue) {
                          setState(() {
                            valuesChoose = newValue.toString();
                          });
                        },
                        items: listItem.map(
                          (valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text('نبذة تعريفية', style: getBodyStyle()),
                  ),
                  const Gap(10),
                  Container(
                    height: 130,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.accentColor,
                    ),
                    child: TextField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText:
                            'سجل المعلومات الطبية العامة مثل تعليمك الأكاديمي و خبراتك السابقة',
                        hintStyle: getBodyStyle(color: AppColors.greyColor),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Gap(10),
                  const Divider(),
                  const Gap(10),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'عنوان العيادة',
                      style: getBodyStyle(),
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: AppColors.accentColor,
                      hintText: '5 شارع مصدق - الدقي - الجيزة',
                      hintStyle: getBodyStyle(color: AppColors.greyColor),
                      border: InputBorder.none,
                    ),
                  ),
                  const Gap(10),
                  // SizedBox(
                  //   width: 120,
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       fillColor: AppColors.accentColor,
                  //       hintText: 'Am 10:00',
                  //       hintStyle: getBodyStyle(color: AppColors.greyColor),
                  //       border: InputBorder.none,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('ساعات العمل من',
                              style: getBodyStyle(fontSize: 14)),
                        ),
                        Expanded(
                          child: Text('الي', style: getBodyStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        onTap: () {},
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'AM 10:00',
                          hintStyle: getBodyStyle(),
                          suffixIcon: const Icon(Icons.watch_later_outlined,
                              color: AppColors.primaryColor),
                        ),
                      )),
                      const Gap(10),
                      Expanded(
                          child: TextFormField(
                        onTap: () {},
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'PM 10:00',
                          hintStyle: getBodyStyle(),
                          suffixIcon: const Icon(Icons.watch_later_outlined,
                              color: AppColors.primaryColor),
                        ),
                      )),
                    ],
                  ),
                  const Gap(10),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'رقم الهاتف 1',
                      style: getSmallStyle(),
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: AppColors.accentColor,
                      hintText: '+20xxxxxxxxxx',
                      hintStyle: getBodyStyle(color: AppColors.greyColor),
                      border: InputBorder.none,
                    ),
                  ),
                  const Gap(10),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'رقم الهاتف 2 (اختياري)',
                      style: getSmallStyle(),
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: AppColors.accentColor,
                      hintText: '+20xxxxxxxxxx',
                      hintStyle: getBodyStyle(color: AppColors.greyColor),
                      border: InputBorder.none,
                    ),
                  ),
                  const Gap(30),
                  CustomButton(
                    onPressed: () {
                      pushReplacement(context, const PatientNavBarWidget());
                    },
                    text: 'التسجيل',
                    textStyle: getBodyStyle(color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(bool isCamera) {
    ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
      }
    });
  }
}
