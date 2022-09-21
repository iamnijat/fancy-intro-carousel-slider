import 'package:flutter/material.dart';
import 'fancy_intro_carousel_slider_dots.dart';

class FancyIntroCarouselSliderItem extends StatelessWidget {
  final Widget item;
  final int slidersCount;
  final Stream<int> pageindexStream;
  final double dotHeight;
  final Widget activeDot;
  final Widget disabledDot;
  final EdgeInsetsGeometry innerPadding;
  final Widget actionButton;
  const FancyIntroCarouselSliderItem({
    super.key,
    required this.item,
    required this.slidersCount,
    required this.pageindexStream,
    required this.dotHeight,
    required this.activeDot,
    required this.disabledDot,
    required this.innerPadding,
    required this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        item,
        const Spacer(),
        StreamBuilder<int>(
            stream: pageindexStream,
            builder: (context, snapshot) {
              final pageIndex = snapshot.data ?? 0;
              final lastIndex = slidersCount - 1;
              return Column(
                children: <Widget>[
                  AnimatedOpacity(
                      opacity: pageIndex == lastIndex ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 750),
                      child: actionButton),
                  FancyIntroCarouselSliderDots(
                    dotHeight: dotHeight,
                    currentPage: pageIndex,
                    innerPadding: innerPadding,
                    sliderListLength: slidersCount,
                    activeDot: activeDot,
                    disabledDot: disabledDot,
                  ),
                ],
              );
            }),
      ],
    );
  }
}
