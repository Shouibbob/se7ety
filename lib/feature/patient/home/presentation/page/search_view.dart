import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'ابحث عن دكتور',
          style: getTitleStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: AppColors.textColor.withOpacity(.2),
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'البحث',
                    hintStyle: getSmallStyle(color: AppColors.textColor),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(5),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('عرض كل الدكتور',
                          style: getTitleStyle(color: AppColors.primaryColor)),
                      SvgPicture.asset('assets/images/no-search.svg'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
