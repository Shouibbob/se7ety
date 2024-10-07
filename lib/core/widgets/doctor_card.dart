import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard(
      {super.key,
      required this.name,
      required this.image,
      required this.specialization,
      required this.rating,
      this.onPressed});

  final String name;
  final String image;
  final String specialization;
  final int rating;
  final Function()? onPressed;

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-3, 0),
            blurRadius: 15,
            color: AppColors.greyColor.withOpacity(.1),
          ),
        ],
      ),
      child: InkWell(
        onTap: widget.onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.whiteColor,
                ),
                child: Image.network(
                  widget.image,
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Gap(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getTitleStyle(fontSize: 16),
                  ),
                  Text(
                    widget.specialization,
                    style: getBodyStyle(),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.rating.toString(),
                  style: getBodyStyle(),
                ),
                const Gap(3),
                const Icon(
                  Icons.star_rate_rounded,
                  size: 20,
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
