import 'dart:async';
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

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  late Timer _timer;
  int _initialSecond = 120;

  startTimer() {
    const tiker = Duration(seconds: 1);
    _timer = Timer.periodic(tiker, (timer) {
      setState(() {
        if (_initialSecond == 0) {
          _timer.cancel();
          Navigator.of(context).pop();
        } else {
          _initialSecond--;
        }
      });
    });
  }

  String formatTimer(int second) {
    int min = second ~/ 60;
    int sec = second % 60;
    String minStr = min.toString().padLeft(2, '0');
    String secStr = sec.toString().padLeft(2, '0');
    return '$minStr:$secStr';
  }

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
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  AppStrings.wrongNumberEditNumber,
                  style: LightModeTextStyle.primaryThemeTextStyle,
                ),
              ),
              AppDimens.large.height,
              AppTextField(
                label: AppStrings.enterActivationCode,
                hint: AppStrings.enterVerificationCode,
                controller: _controller,
                inputType: TextInputType.number,
                prefixLabel: formatTimer(_initialSecond),
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
