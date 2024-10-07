import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/utils/colors.dart';

showErrorDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.redColor,
      content: Text(text),
    ),
  );
}

showSuccessSnackDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Text(text),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/images/loading.json',
              width: 250,
            ),
          ],
        );
      });
}

showSuccessDialog(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Lottie.asset('assets/images/success.json');
      });
}
