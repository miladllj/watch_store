import 'dart:io';

import 'package:flutter/material.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.onTap, required this.file});
  final VoidCallback onTap;
  final File? file;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: size.width * .3,
            width: size.width * .3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: file == null
                  ? Image.asset(Assets.png.avatar.path)
                  : Image.file(file!),
            ),
          ),
          AppDimens.medium.height,
          const Text(
            AppStrings.chooseProfileImage,
            style: LightModeTextStyle.avatarText,
          )
        ],
      ),
    );
  }
}
