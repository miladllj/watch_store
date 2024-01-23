import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class BtmNavItem extends StatelessWidget {
  const BtmNavItem({
    super.key,
    required this.iconSvgPath,
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  final String iconSvgPath;
  final String text;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: LightAppColors.btmNavColor,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconSvgPath,
                colorFilter: ColorFilter.mode(
                    isActive
                        ? LightAppColors.btmNavActiveColor
                        : LightAppColors.btmNavInActiveColor,
                    BlendMode.srcIn),
              ),
              AppDimens.small.height,
              Text(
                text,
                style: isActive
                    ? LightModeTextStyle.btmNavActiveTextStyle
                    : LightModeTextStyle.btmNavInActiveTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
