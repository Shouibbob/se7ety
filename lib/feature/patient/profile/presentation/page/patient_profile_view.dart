import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button_widget.dart';
import 'package:se7ety/feature/patient/profile/presentation/page/settings_view.dart';
import 'package:se7ety/feature/patient/search/presentation/widgets/tile_widget.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  String? _imagePath;
  File? file;
  String? profileUrl;

  String? userId;

  Future<void> _getUser() async {
    userId = FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> uploadImageToFirebase(File image, String imageName) async {
    Reference ref =
        FirebaseStorage.instanceFor(bucket: 'gs://se7eity-121.appspot.com')
            .ref()
            .child('patients/${FirebaseAuth.instance.currentUser!.uid}');
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    await ref.putFile(image, metadata);
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<void> _pickImage() async {
    _getUser();
    final pickFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickFile != null) {
      setState(() {
        _imagePath = pickFile.path;
        file = File(pickFile.path);
      });
    }
    profileUrl = await uploadImageToFirebase(file!, 'doc');
    FirebaseFirestore.instance.collection('patients').doc(userId).set({
      'image': profileUrl,
    }, SetOptions(merge: true));
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
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: const Text(
          'الحساب الشخصي',
        ),
        iconTheme: const IconThemeData(color: AppColors.textColor),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.settings,
              color: AppColors.whiteColor,
            ),
            onPressed: () {
              push(context, const UserSettings());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('patients')
              .doc(userId)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            var userData = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
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
                                radius: 60,
                                backgroundColor: AppColors.whiteColor,
                                backgroundImage: (userData?['image'] != '')
                                    ? NetworkImage(userData?['image'])
                                    : (_imagePath != null)
                                        ? FileImage(File(_imagePath!))
                                        : const AssetImage(
                                            'assets/images/doc.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await _pickImage();
                              },
                              child: const CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.whiteColor,
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(30),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${userData!['name']}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: getTitleStyle(),
                              ),
                              const Gap(10),
                              (userData['city'] == '')
                                  ? CustomButton(
                                      text: 'تعديل الحساب',
                                      onPressed: () {},
                                    )
                                  : Text(
                                      userData['city'],
                                      maxLines: 2,
                                      style: getBodyStyle(),
                                    ),
                              const Gap(15),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Gap(25),
                    Text(
                      'نبذة تعريفية',
                      style: getBodyStyle(fontWeight: FontWeight.w600),
                    ),
                    const Gap(10),
                    Text(
                      userData['bio'] == '' ? 'لم تظهر' : userData['bio'],
                      style: getSmallStyle(),
                    ),
                    const Gap(20),
                    const Divider(),
                    const Gap(20),
                    Text(
                      'معلومات التواصل',
                      style: getBodyStyle(fontWeight: FontWeight.w600),
                    ),
                    const Gap(10),
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.accentColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TileWidget(
                            text: userData['email'] ?? 'لم تضاف',
                            icon: Icons.email,
                          ),
                          const Gap(15),
                          TileWidget(
                            text: userData['phone'] == ''
                                ? 'لم تضاف'
                                : userData['phone'],
                            icon: Icons.call,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const Gap(20),
                    Text(
                      'حجوزاتي',
                      style: getBodyStyle(fontWeight: FontWeight.w600),
                    ),
                    // const AppointmentHistoryList(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
