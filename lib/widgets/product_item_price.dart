import 'package:flutter/material.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class ProductItemPrice extends StatelessWidget {
  const ProductItemPrice({
    super.key,
    required this.price,
    this.oldPrice = 0,
    this.discount = 0,
  });

  final int price;
  final int discount;
  final int oldPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${price.seprateWithComma} تومان',
              style: LightModeTextStyle.title,
              textDirection: TextDirection.rtl,
            ),
            AppDimens.medium.width,
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
                  style: LightModeTextStyle.discountTextStyle
                      .copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: discount > 0 ? true : false,
          child: Text(
            oldPrice.seprateWithComma,
            style: LightModeTextStyle.oldPriceStyle,
          ),
        )
      ],
    );
  }
}
