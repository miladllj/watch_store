import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class SearchBtn extends StatelessWidget {
  const SearchBtn({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.large),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
            color: LightAppColors.searchBar,
            borderRadius: BorderRadius.circular(60),
            boxShadow: const [
              BoxShadow(
                color: LightAppColors.shadow,
                offset: Offset(0, 3),
                blurRadius: 3,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(Assets.svg.search),
              const Text(
                AppStrings.searchProduct,
                style: LightModeTextStyle.hint,
              ),
              Image.asset(
                Assets.png.mainLogo.path,
                scale: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
