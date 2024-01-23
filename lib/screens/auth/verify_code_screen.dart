import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route/names.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/main_button.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mobileRouteArg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.png.mainLogo.path,
              ),
              AppDimens.medium.height,
              Text(
                AppStrings.otpCodeSendFor
                    .replaceAll(AppStrings.replace, mobileRouteArg),
                style: LightModeTextStyle.title,
              ),
              AppDimens.small.height,
              const Text(
                AppStrings.wrongNumberEditNumber,
                style: LightModeTextStyle.primaryThemeTextStyle,
              ),
              AppDimens.large.height,
              AppTextField(
                label: AppStrings.enterYourNumber,
                hint: AppStrings.enterVerificationCode,
                controller: _controller,
                inputType: TextInputType.number,
                prefixLabel: "2:56",
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is VerifiedAndNotRegisteredState) {
                    Navigator.pushNamed(context, ScreenNames.registerScreen);
                  } else if (state is VerifiedAndRegisteredState) {
                    Navigator.pushNamed(context, ScreenNames.mainScreen);
                  } else if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 800),
                        backgroundColor: Colors.red,
                        content: Text('خطایی رخ داده'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return MainButton(
                      text: AppStrings.next,
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .verifyCode(mobileRouteArg, _controller.text);
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
