import 'package:flutter/material.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/strings.dart';

class RegisterAppBar extends StatelessWidget implements PreferredSize {
  const RegisterAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(size.width, size.height * .1),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
          const Text(
            AppStrings.register,
            style: LightModeTextStyle.title,
          )
        ],
      ),
    );
  }
  
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size.height*.1);
}