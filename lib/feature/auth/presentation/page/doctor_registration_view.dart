import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:se7ety/core/constants/specialization_data.dart';
import 'package:se7ety/core/function/dialogs.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/auth/data/models/doctor_model.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_event.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_state.dart';
import 'package:se7ety/feature/patient/nav_bar.dart';

class DoctorRegistrationView extends StatefulWidget {
  const DoctorRegistrationView({super.key});

  @override
  State<DoctorRegistrationView> createState() => _DoctorRegistrationViewState();
}

class _DoctorRegistrationViewState extends State<DoctorRegistrationView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _phone1 = TextEditingController();
  final TextEditingController _phone2 = TextEditingController();
  String _specialization = specialization[0];

  late String _startTime =
      DateFormat('hh').format(DateTime(2023, 9, 7, 10, 00));
  late String _endTime = DateFormat('hh').format(DateTime(2023, 9, 7, 22, 00));

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  String? _imagePath;
  File? file;
  String? profileUrl;

  String? userId;

  Future<void> _getUser() async {
    userId = FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> uploadImageToFirebase(File image) async {
    Reference ref =
        FirebaseStorage.instanceFor(bucket: 'gs://se7eity-121.appspot.com')
            .ref()
            .child('doctors/$userId-${DateTime.now().toUtc()}');
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    await ref.putFile(image, metadata);
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<void> _pickImage() async {
    _getUser();
    final pickFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      setState(() {
        _imagePath = pickFile.path;
        file = File(pickFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اكمال عملية التسجبل'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UpdateDoctorRegisterSuccessState) {
            pushAndRemoveUntil(context, const PatientNavBarWidget());
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, state.error);
          } else if (state is UpdateDoctorRegisterLoadingState) {
            showLoadingDialog(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: (_imagePath != null)
                                  ? FileImage(File(_imagePath!))
                                  : const AssetImage('assets/images/doc.png'),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                        child: Row(
                          children: [
                            Text(
                              'التخصص',
                              style: getBodyStyle(color: AppColors.textColor),
                            ),
                          ],
                        ),
                      ),
                      // ----- التخصص ----
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButton(
                          isExpanded: true,
                          iconEnabledColor: AppColors.primaryColor,
                          icon: const Icon(Icons.expand_circle_down_outlined),
                          value: _specialization,
                          onChanged: (String? newValue) {
                            setState(() {
                              _specialization = newValue ?? specialization[0];
                            });
                          },
                          items: specialization.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Text(
                              'نبذة تعريفية',
                              style: getBodyStyle(color: AppColors.textColor),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        controller: _bio,
                        style: const TextStyle(color: AppColors.textColor),
                        decoration: const InputDecoration(
                          hintText:
                              'سجل المعلومات الطبية العامة مثل تعليمك الأكاديمي و خبراتك السابقة',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك أدخل النبذة التعريفية';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Text(
                              'عنوان العيادة',
                              style: getBodyStyle(color: AppColors.textColor),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _address,
                        style: const TextStyle(color: AppColors.textColor),
                        decoration: const InputDecoration(
                          hintText: '5 شارع مصدق - الدقي - الجيزة',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك أدخل عنوان العيادة';
                          } else {
                            return null;
                          }
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Text(
                                    'ساعات العمل من',
                                    style: getBodyStyle(
                                        color: AppColors.textColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Text(
                                    'الي',
                                    style: getBodyStyle(
                                        color: AppColors.textColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      await showStartTimePicker();
                                    },
                                    icon: const Icon(
                                      Icons.watch_later_outlined,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  hintText: _startTime),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      await showEndTimePicker();
                                    },
                                    icon: const Icon(
                                      Icons.watch_later_outlined,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  hintText: _endTime),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Text(
                              'رقم الهاتف 1',
                              style: getBodyStyle(color: AppColors.textColor),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _phone1,
                        style: const TextStyle(color: AppColors.textColor),
                        decoration: const InputDecoration(
                          hintText: '+20xxxxxxxxxx',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك أدخل رقم الهاتف';
                          } else {
                            return null;
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Text(
                              'رقم الهاتف 2',
                              style: getBodyStyle(color: AppColors.textColor),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _phone2,
                        style: const TextStyle(color: AppColors.textColor),
                        decoration: const InputDecoration(
                          hintText: '+20xxxxxxxxxx',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(top: 25),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate() && file != null) {
                profileUrl = await uploadImageToFirebase(file!);
                context.read<AuthBloc>().add(UpdateDoctorRegistrationEvent(
                        model: DoctorModel(
                      uid: userId,
                      image: profileUrl,
                      phone1: _phone1.text,
                      phone2: _phone2.text,
                      address: _address.text,
                      specialization: _specialization,
                      openHour: _startTime,
                      closeHour: _endTime,
                      bio: _bio.text,
                    )));
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     content: Text('تم التسجيل بنجاح'),
                //   ),
                // );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('من فضلك قم بتحميل صورتك الشخصية'),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'تسجيل',
              style: getBodyStyle(color: AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }

  showStartTimePicker() async {
    final startTimePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (startTimePicked != null) {
      setState(() {
        _startTime = startTimePicked.hour.toString();
      });
    }
  }

  showEndTimePicker() async {
    final endTimePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
          DateTime.now().add(const Duration(minutes: 15))),
    );

    if (endTimePicked != null) {
      setState(() {
        _endTime = endTimePicked.hour.toString();
      });
    }
  }
}
