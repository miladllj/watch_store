import 'package:flutter/material.dart';
import 'package:watch_store/components/button_style.dart';
import 'package:watch_store/components/text_style.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyles.secondaryButtonStyle(color),
      onPressed: onPressed,
      child: Text(
        text,
        style: LightModeTextStyle.mainButton,
      ),
    );
  }
}
