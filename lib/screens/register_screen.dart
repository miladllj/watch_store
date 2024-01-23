import 'package:flutter/material.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route/names.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/avatar.dart';
import 'package:watch_store/widgets/main_button.dart';
import 'package:watch_store/widgets/register_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController _controllerNameLastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: RegisterAppBar(size: size),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDimens.large.height,
                  const Avatar(),
                  AppTextField(
                    label: AppStrings.nameLastName,
                    hint: AppStrings.hintNameLastName,
                    controller: _controllerNameLastName,
                  ),
                  AppTextField(
                    label: AppStrings.homeNumber,
                    hint: AppStrings.hintHomeNumber,
                    controller: _controllerNameLastName,
                  ),
                  AppTextField(
                    label: AppStrings.address,
                    hint: AppStrings.hintAddress,
                    controller: _controllerNameLastName,
                  ),
                  AppTextField(
                    label: AppStrings.postalCode,
                    hint: AppStrings.hintPostalCode,
                    controller: _controllerNameLastName,
                  ),
                  AppTextField(
                    label: AppStrings.location,
                    hint: AppStrings.hintLocation,
                    controller: _controllerNameLastName,
                    icon: const Icon(Icons.location_on),
                  ),
                  MainButton(text: AppStrings.next, onPressed: () => Navigator.pushNamed(context, ScreenNames.mainScreen)),
                  AppDimens.large.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
