import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/patient/home/presentation/page/home_search_view.dart';
import 'package:se7ety/feature/patient/home/presentation/widgets/specialist_widget.dart';
import 'package:se7ety/feature/patient/home/presentation/widgets/top_rated_widget.dart';

class PatientHomeView extends StatefulWidget {
  const PatientHomeView({super.key});

  @override
  State<PatientHomeView> createState() => _PatientHomeViewState();
}

class _PatientHomeViewState extends State<PatientHomeView> {
  final TextEditingController _doctorName = TextEditingController();
  User? user;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active,
                color: AppColors.textColor,
              ),
              splashRadius: 20,
            ),
          )
        ],
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Text(
          'صحتي',
          style: getTitleStyle(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: 'مرحباً ',
                    style: getBodyStyle(fontSize: 18),
                  ),
                  TextSpan(
                    text: user?.displayName,
                    style: getTitleStyle(),
                  ),
                ],
              )),
              Text(
                'احجز الان وكن جزا من رحلتك الصحية',
                style: getTitleStyle(color: AppColors.textColor, fontSize: 25),
              ),
              const Gap(15),
              //-------------------- Search Bar --------------------
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyColor.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  controller: _doctorName,
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    hintStyle: getBodyStyle(),
                    filled: true,
                    hintText: 'ابحث عن دكتور',
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        splashRadius: 20,
                        onPressed: () {
                          setState(() {
                            if (_doctorName.text.isNotEmpty) {
                              push(
                                  context,
                                  HomeSearchView(
                                    searchKey: _doctorName.text,
                                  ));
                            }
                          });
                        },
                        icon: const Icon(Icons.search,
                            color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  style: getBodyStyle(),
                  onFieldSubmitted: (value) {
                    setState(() {
                      if (_doctorName.text.isNotEmpty) {
                        push(
                            context,
                            HomeSearchView(
                              searchKey: _doctorName.text,
                            ));
                      }
                    });
                  },
                ),
              ),
              const Gap(16),
              //-------------------- SpecialistWidget --------------------

              const SpecialistBanner(),
              const Gap(10),
              //--------------------- Top Rated --------------------

              Text(
                'الأعلي تقيما',
                style: getTitleStyle(fontSize: 16),
              ),
              const Gap(10),
              const TopRatedList(),
            ],
          ),
        ),
      ),
    );
  }
}
