import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/patient/home/data/card.dart';

class SpecialistBanner extends StatefulWidget {
  const SpecialistBanner({super.key});

  @override
  State<SpecialistBanner> createState() => _SpecialistBannerState();
}

class _SpecialistBannerState extends State<SpecialistBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تخصصات',
          style: getTitleStyle(fontSize: 16),
        ),
        SizedBox(
          height: 230,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: ItemCardWidget(
                  title: cards[index].specialization,
                  color: cards[index].cardBackground,
                  lightColor: cards[index].cardLightColor,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget(
      {super.key,
      required this.title,
      required this.color,
      required this.lightColor});
  final String title;
  final Color color;
  final Color lightColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      margin: const EdgeInsets.only(
        left: 15,
        bottom: 15,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 10,
            color: lightColor.withOpacity(.8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: CircleAvatar(
                backgroundColor: lightColor,
                radius: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: SvgPicture.asset('assets/images/doctor-card.svg'),
                  ),
                  const Gap(10),
                  Flexible(
                    child: Text(
                      title,
                      style: getTitleStyle(
                          color: AppColors.whiteColor, fontSize: 14),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
