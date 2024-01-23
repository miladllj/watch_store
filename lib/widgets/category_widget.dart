import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.colors,
    required this.iconPath,
  });
  final String title;
  final VoidCallback onTap;
  final List<Color> colors;
  final iconPath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppDimens.small),
            height: size.height * .09,
            width: size.height * .09,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors,
              ),
              borderRadius: BorderRadius.circular(
                AppDimens.large,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: SvgPicture.asset(iconPath),
                ),
              ],
            ),
          ),
          (AppDimens.small * .5).height,
          Text(
            title,
            style: LightModeTextStyle.title,
          )
        ],
      ),
    );
  }
}
