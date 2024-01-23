import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/surface_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppStrings.profile,
              style: LightModeTextStyle.title,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDimens.large.height,
                  Image.asset(Assets.png.avatar.path),
                  AppDimens.medium.height,
                  const Text(
                    'ساسان صفری',
                    style: LightModeTextStyle.avatarText,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.activeAddress,
                      style: LightModeTextStyle.title,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.svg.back),
                        const Expanded(
                          child: Text(
                            AppStrings.lorem,
                            style: LightModeTextStyle.title,
                            softWrap: true,
                            maxLines: 2,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppDimens.small.height,
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: LightAppColors.surfaceColor,
                  ),
                  ProfileItem(
                    svgIcon: Assets.svg.card,
                    content: '123456789',
                  ),
                  ProfileItem(
                    svgIcon: Assets.svg.phone,
                    content: '123456789',
                  ),
                  ProfileItem(
                    svgIcon: Assets.svg.user,
                    content: 'ساسان صفری',
                  ),
                  const SurfaceContainer(
                    child: Text(
                      AppStrings.rules,
                      style: LightModeTextStyle.title,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SurfaceContainer(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfilePurchaseItem(
                            svgIcon: Assets.svg.delivered,
                            title: AppStrings.delivered,
                          ),
                          ProfilePurchaseItem(
                            svgIcon: Assets.svg.canceled,
                            title: AppStrings.canceled,
                          ),
                          ProfilePurchaseItem(
                            svgIcon: Assets.svg.processing,
                            title: AppStrings.processing,
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppDimens.medium.height,
                  Image.asset(Assets.png.ad.path)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePurchaseItem extends StatelessWidget {
  const ProfilePurchaseItem({
    super.key,
    required this.svgIcon,
    required this.title,
  });

  final String svgIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgIcon),
        AppDimens.medium.height,
        Text(
          title,
          style: LightModeTextStyle.title,
        )
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.svgIcon,
    required this.content,
  });

  final String svgIcon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Expanded(
              child: Text(
                content,
                style: LightModeTextStyle.title,
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.right,
              ),
            ),
            AppDimens.small.width,
            SvgPicture.asset(svgIcon),
          ],
        ),
      ),
    );
  }
}
