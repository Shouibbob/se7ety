import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/enum/user_type_enum.dart';
import 'package:se7ety/core/function/dialogs.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button_widget.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_event.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_state.dart';
import 'package:se7ety/feature/auth/presentation/page/register_view.dart';
import 'package:se7ety/feature/patient/nav_bar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.userType});

  final UserType userType;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisable = true;
  String handleUserType() {
    return widget.userType == UserType.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (widget.userType == UserType.patient) {
            pushAndRemoveUntil(context, const PatientNavBarWidget());
          } else {
            //pushAndRemoveUntil(context, const PatientNavBarWidget());
          }
        } else if (state is AuthErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.error);
        } else {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          leading: const BackButton(),
        ),
        body: Center(
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
                      'سجل دخول ك"${handleUserType()}"',
                      style: getHeadLineStyle(),
                    ),
                    const Gap(30),
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
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(top: 5, right: 10),
                      child: Text(
                        'نسيت كلمة المرور؟',
                        style: getSmallStyle(),
                      ),
                    ),
                    const Gap(30),
                    CustomButton(
                        text: 'تسجيل حساب',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  LoginEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          }
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ليس لدي حساب؟',
                            style: getBodyStyle(color: AppColors.textColor),
                          ),
                          TextButton(
                            onPressed: () {
                              pushReplacement(
                                  context,
                                  RegisterView(
                                    userType: widget.userType,
                                  ));
                            },
                            child: Text(
                              'سجل الأن',
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
