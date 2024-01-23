import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/cart_badge.dart';
import 'package:watch_store/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CartBadge(
              count: 1,
            ),
            Row(
              children: [
                const Text('پرفروش ترین ها'),
                AppDimens.small.width,
                SvgPicture.asset(Assets.svg.sort)
              ],
            ),
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(Assets.svg.close))
          ],
        )),
        body: const Column(
          children: [TagList(), ProductGridView()],
        ),
      ),
    );
  }
}


class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.medium, horizontal: AppDimens.small),
      child: SizedBox(
        height: AppDimens.large,
        child: ListView.builder(
          reverse: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
              decoration: BoxDecoration(
                color: LightAppColors.tagColor,
                borderRadius: BorderRadius.circular(AppDimens.large),
              ),
              child: const Text(
                'نیوفورس',
                style: LightModeTextStyle.tagTitle,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.medium),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return const ProductItem(productName: 'productName', price: 100, discount: 20,);
          },
        ),
      ),
    );
  }
}
