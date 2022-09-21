import 'package:flutter/material.dart';

class FancyIntroCarouselSliderDots extends StatelessWidget {
  final int currentPage;
  final int sliderListLength;
  final double dotHeight;
  final Widget activeDot;
  final Widget disabledDot;
  final EdgeInsetsGeometry innerPadding;
  const FancyIntroCarouselSliderDots({
    Key? key,
    required this.currentPage,
    required this.sliderListLength,
    required this.dotHeight,
    required this.activeDot,
    required this.disabledDot,
    required this.innerPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dotHeight,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: sliderListLength,
          padding: innerPadding,
          itemBuilder: (context, index) {
            final isActive = index == currentPage;
            return isActive ? activeDot : disabledDot;
          }),
    );
  }
}
