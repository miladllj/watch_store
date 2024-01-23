import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_slider.dart';
import 'package:watch_store/widgets/category_widget.dart';
import 'package:watch_store/widgets/product_item.dart';
import 'package:watch_store/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBtn(
                onTap: () {},
              ),
              const AppSlider(
                imgList: [],
              ),
              // Category
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryWidget(
                    title: AppStrings.desktop,
                    onTap: () {},
                    colors: LightAppColors.desktopCategoryColors,
                    iconPath: Assets.svg.desktop,
                  ),
                  CategoryWidget(
                    title: AppStrings.digital,
                    onTap: () {},
                    colors: LightAppColors.digitalCategoryColors,
                    iconPath: Assets.svg.digital,
                  ),
                  CategoryWidget(
                    title: AppStrings.smart,
                    onTap: () {},
                    colors: LightAppColors.smartCategoryColors,
                    iconPath: Assets.svg.smart,
                  ),
                  CategoryWidget(
                    title: AppStrings.classic,
                    onTap: () {},
                    colors: LightAppColors.classicCategoryColors,
                    iconPath: Assets.svg.classic,
                  ),
                ],
              ),

              AppDimens.large.height,

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  children: [
                    SizedBox(
                      height: 320,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const ProductItem(
                            productName: 'ساعت مردانه',
                            price: 200,
                          );
                        },
                      ),
                    ),
                    const VerticalText()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 24, 8),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.svg.leftArrow),
                AppDimens.small.width,
                const Text(AppStrings.seeAll)
              ],
            ),
            AppDimens.medium.height,
            const Text(
              AppStrings.amazing,
              style: LightModeTextStyle.amazingStyle,
            )
          ],
        ),
      ),
    );
  }
}
