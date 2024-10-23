import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

class IconTile extends StatelessWidget {
  const IconTile(
      {super.key,
      required this.imgAssetPath,
      required this.backColor,
      required this.num,
      this.onTap});
  final IconData imgAssetPath;
  final Color backColor;
  final void Function()? onTap;
  final String num;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(num),
            Icon(
              imgAssetPath,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
