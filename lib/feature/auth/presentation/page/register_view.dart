import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/enum/user_type_enum.dart';
import 'package:se7ety/core/function/dialogs.dart';
import 'package:se7ety/core/function/email_validate.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button_widget.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_event.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_state.dart';
//import 'package:se7ety/feature/auth/presentation/page/doctor_data.dart';
import 'package:se7ety/feature/auth/presentation/page/doctor_registration_view.dart';
import 'package:se7ety/feature/auth/presentation/page/login_view.dart';
import 'package:se7ety/feature/patient/nav_bar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.userType});

  final UserType userType;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisable = true;
  String handleUserType() {
    return widget.userType == UserType.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: const BackButton(),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            showLoadingDialog(context);
          } else if (state is RegisterSuccessState) {
            if (widget.userType == UserType.doctor) {
              pushAndRemoveUntil(context, const DoctorRegistrationView());
            } else {
              pushAndRemoveUntil(context, const PatientNavBarWidget());
            }
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, state.error);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 300,
                    ),
                    const Gap(10),
                    Text(
                      'سجل حساب جديد ك "${handleUserType()}"',
                      style: getHeadLineStyle(),
                    ),
                    const Gap(30),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      style: const TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                        hintText: 'الاسم',
                        hintStyle: getBodyStyle(color: AppColors.greyColor),
                        prefixIcon: const Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك أدخل الاسم';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(25),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      style: const TextStyle(color: AppColors.textColor),
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        hintText: 'Shoui@example.com',
                        hintStyle: getBodyStyle(color: AppColors.greyColor),
                        prefixIcon: const Icon(Icons.email_rounded),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك أدخل الايميل';
                        } else if (!emailValidate(value)) {
                          return 'من فضلك أدخل الايميل صحيحا';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(25),
                    TextFormField(
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      style: const TextStyle(color: AppColors.textColor),
                      obscureText: isVisable,
                      decoration: InputDecoration(
                        hintText: '********',
                        hintStyle: getBodyStyle(color: AppColors.greyColor),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                          icon: Icon((isVisable)
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_rounded),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك أدخل كلمة المرور';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(30),
                    CustomButton(
                        text: 'تسجيل حساب',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(RegisterEvent(
                                  email: emailController.text,
                                  name: nameController.text,
                                  password: passwordController.text,
                                  userType: widget.userType,
                                ));
                          }
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'لدي حساب ؟',
                            style: getBodyStyle(color: AppColors.textColor),
                          ),
                          TextButton(
                            onPressed: () {
                              pushReplacement(
                                  context,
                                  LoginView(
                                    userType: widget.userType,
                                  ));
                            },
                            child: Text(
                              'سجل دخول',
                              style:
                                  getBodyStyle(color: AppColors.primaryColor),
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
        ),
      ),
    );
  }
}
