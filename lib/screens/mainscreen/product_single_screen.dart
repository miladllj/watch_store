import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/cart_badge.dart';
import 'package:watch_store/widgets/product_item_price.dart';
import 'package:watch_store/widgets/secondary_button.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Row(
            children: [
              const CartBadge(),
              const Expanded(
                  child: Text(
                'اسم محصول',
                style: LightModeTextStyle.title,
                textDirection: TextDirection.rtl,
              )),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.svg.close),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                Assets.png.watch1.path,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width,
              ),
              Container(
                margin: const EdgeInsets.all(AppDimens.medium),
                padding: const EdgeInsets.all(AppDimens.medium),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.medium),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'بنسر',
                      style: LightModeTextStyle.productTitle,
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      'مسواک بنسر مدل اکسترا با برس متوسط 3 عددی',
                      style: LightModeTextStyle.caption,
                      textDirection: TextDirection.rtl,
                    ),
                    const Divider(),
                    const ProductTabView(),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          height: MediaQuery.sizeOf(context).height * .09,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const ProductItemPrice(
                    price: 120000,
                    oldPrice: 200000,
                    discount: 5,
                  ),
                  SecondaryButton(
                    text: AppStrings.addToCart,
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  var selectedTabIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: MediaQuery.sizeOf(context).width / 3,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => setState(() {
                  selectedTabIndex = index;
                }),
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.medium),
                  child: Text(
                    tabs[index],
                    style: index == selectedTabIndex
                        ? LightModeTextStyle.selectedTab
                        : LightModeTextStyle.unSelectedTab,
                  ),
                ),
              );
            },
          ),
        ),
        IndexedStack(
          index: selectedTabIndex,
          children: const [
            Review(),
            Comments(),
            Features(),
          ],
        )
      ],
    );
  }
}

List<String> tabs = [
  "نقد و بررسی",
  'نظرات',
  'مشخصات',
];

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('''
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات
        جزئیات''');
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('نظرات');
  }
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('بررسی');
  }
}
