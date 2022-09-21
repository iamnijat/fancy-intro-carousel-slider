import 'package:flutter/material.dart';

class FancyIntroCarouselSliderDots extends StatelessWidget {
  const FancyIntroCarouselSliderDots({
    Key? key,
    required this.currentPage,
    required this.itemCount,
    required this.dotHeight,
    required this.activeDot,
    required this.disabledDot,
    required this.innerPadding,
  }) : super(key: key);

  /// Used to define currentPage with [int]
  final int currentPage;

  /// Defined itemCount with [int]
  final int itemCount;

  /// Used to define dot height in slider dots with [double]
  final double dotHeight;

  /// Used for defining activeDot [Widget]
  final Widget activeDot;

  /// Used for defining disabledDot [Widget]
  final Widget disabledDot;

  /// Used for assigning innerPadding between slider dots with [EdgeInsetsGeometry]
  final EdgeInsetsGeometry innerPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dotHeight,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          padding: innerPadding,
          itemBuilder: (context, index) {
            final isActive = index == currentPage;
            return isActive ? activeDot : disabledDot;
          }),
    );
  }
}
