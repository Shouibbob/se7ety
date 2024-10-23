import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button_widget.dart';
import 'package:se7ety/feature/auth/data/models/doctor_model.dart';
import 'package:se7ety/feature/patient/search/presentation/widgets/phone_tile.dart';
import 'package:se7ety/feature/patient/search/presentation/widgets/tile_widget.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key, this.doctorModel});
  final DoctorModel? doctorModel;

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  late DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بيانات الدكتور'),
        leading: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            splashRadius: 25,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.whiteColor,
                        child: CircleAvatar(
                          backgroundColor: AppColors.whiteColor,
                          radius: 60,
                          backgroundImage: (widget.doctorModel?.image != null)
                              ? NetworkImage(widget.doctorModel!.image!)
                              : const AssetImage('assets/images/doc.png'),
                        ),
                      )
                    ],
                  ),
                  const Gap(30),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'د. ${widget.doctorModel?.name ?? ''}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getTitleStyle(),
                        ),
                        Text(
                          widget.doctorModel?.specialization ?? '',
                          style: getBodyStyle(),
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            Text(
                              widget.doctorModel?.rating.toString() ?? '0.0',
                              style: getBodyStyle(),
                            ),
                            const Gap(5),
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            IconTile(
                                onTap: () {},
                                backColor: AppColors.accentColor,
                                imgAssetPath: Icons.phone,
                                num: '1'),
                            if (widget.doctorModel?.phone2 != null)
                              IconTile(
                                  onTap: () {},
                                  backColor: AppColors.accentColor,
                                  imgAssetPath: Icons.phone,
                                  num: '2'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(25),
              Text(
                'نبذة تعريفية',
                style: getBodyStyle(fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                widget.doctorModel?.bio ?? '',
                style: getSmallStyle(),
              ),
              const Gap(20),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.accentColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TileWidget(
                      text:
                          '${widget.doctorModel?.openHour} - ${widget.doctorModel?.closeHour}',
                      icon: Icons.watch_later_outlined,
                    ),
                    const Gap(10),
                    TileWidget(
                      text: widget.doctorModel?.address ?? '',
                      icon: Icons.location_on_rounded,
                    ),
                  ],
                ),
              ),
              const Divider(),
              const Gap(20),
              Text(
                'معلومات الاتصال',
                style: getBodyStyle(fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.accentColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TileWidget(
                        text: widget.doctorModel?.email ?? '',
                        icon: Icons.email),
                    const Gap(15),
                    TileWidget(
                        text: widget.doctorModel?.phone1 ?? '',
                        icon: Icons.call),
                    const Gap(15),
                    if (widget.doctorModel?.phone2 != null)
                      TileWidget(
                          text: widget.doctorModel?.phone2 ?? '',
                          icon: Icons.call),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: CustomButton(
          text: 'احجز موعد الان',
          onPressed: () {},
        ),
      ),
    );
  }
}
