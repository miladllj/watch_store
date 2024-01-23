import 'package:flutter/material.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productName,
    required this.price,
    this.oldPrice = 0,
    this.discount = 0,
    this.time = 0,
  });
  final String productName;
  final int price;
  final int oldPrice;
  final int discount;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.small),
      margin: const EdgeInsets.all(AppDimens.medium),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.medium),
        gradient: const LinearGradient(
          colors: LightAppColors.productBgGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Image.asset(Assets.png.watch1.path),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              productName,
              style: LightModeTextStyle.productTitle,
            ),
          ),
          AppDimens.medium.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${price.seprateWithComma} تومان',
                    style: LightModeTextStyle.title,
                  ),
                  Visibility(
                    visible: discount > 0 ? true : false,
                    child: Text(
                      oldPrice.seprateWithComma,
                      style: LightModeTextStyle.oldPriceStyle,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: discount > 0 ? true : false,
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.small * .6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.red,
                  ),
                  child: Text(
                    ' $discount% ',
                    style: LightModeTextStyle.discountTextStyle,
                  ),
                ),
              )
            ],
          ),
          AppDimens.large.height,
          Visibility(
            visible: time > 0 ? true : false,
            child: Container(
              height: 2,
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
          AppDimens.medium.height,
          Visibility(
            visible: time > 0 ? true : false,
            child: Text(
              '$time',
              style: LightModeTextStyle.productTimerStyle,
            ),
          )
        ],
      ),
    );
  }
}
