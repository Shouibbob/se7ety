import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/function/dialogs.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button_widget.dart';
import 'package:se7ety/feature/auth/presentation/page/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.index});

  final int index;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisable = true;
  String handleUserType(int index) {
    return index == 0 ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    'سجل حساب جديد ك "${handleUserType(widget.index)}"',
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
                          showSuccessSnackDialog(context, 'تم التسجيل بنجاح');
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
                                  index: widget.index,
                                ));
                          },
                          child: Text(
                            'سجل دخول',
                            style: getBodyStyle(color: AppColors.primaryColor),
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
    );
  }
}
