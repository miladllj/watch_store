import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

//TODO Fake Slider Images
final List<String> imgList = [
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
];

class AppSlider extends StatefulWidget {
  const AppSlider({super.key, required this.imgList});

  final List<String> imgList;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  final CarouselController _controller = CarouselController();
  final List<Widget> items = imgList
      .map(
        (img) => Padding(
          padding: const EdgeInsets.all(AppDimens.medium),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            child: Image.network(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
      .toList();

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 250,
      width: size.width * .9,
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            items: items,
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList
                .asMap()
                .entries
                .map(
                  (img) => Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () => _controller.animateToPage(img.key),
                      child: Container(
                        width: AppDimens.medium,
                        height: AppDimens.medium,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: LightAppColors.sliderIndicatorColor,
                              width: 1.5),
                          color: _current == img.key
                              ? LightAppColors.sliderIndicatorColor
                              : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
