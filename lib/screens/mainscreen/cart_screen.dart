import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/shopping_cart_item.dart';
import 'package:watch_store/widgets/surface_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppStrings.cart,
              style: LightModeTextStyle.title,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimens.medium),
              margin: const EdgeInsets.only(top: AppDimens.medium),
              height: size.height * .15,
              width: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                  )
                ],
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.back),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          AppStrings.sendToAddress,
                          style: LightModeTextStyle.caption,
                        ),
                        Text(
                          textDirection: TextDirection.rtl,
                          AppStrings.lorem,
                          style: LightModeTextStyle.caption,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const ShoppingCartItem(
                    productTitle: 'ساعت شیائومی mi Watch lite',
                    price: 500000,
                    oldPrice: 800000,
                  );
                },
              ),
            ),
            Container(
              height: size.height * .1,
              width: double.infinity,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
