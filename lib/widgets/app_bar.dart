import 'package:flutter/material.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.child});

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.large),
        height: preferredSize.height,
        decoration: const BoxDecoration(
          color: LightAppColors.appBar,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimens.medium),
            bottomRight: Radius.circular(
              AppDimens.medium,
            ),
          ),
          boxShadow: [
            BoxShadow(
                color: LightAppColors.shadow,
                offset: Offset(0, 2),
                blurRadius: 4),
          ],
        ),
        child: child,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
