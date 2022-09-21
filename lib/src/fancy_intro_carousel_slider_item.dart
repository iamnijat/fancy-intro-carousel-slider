import 'package:flutter/material.dart';
import 'fancy_intro_carousel_slider_dots.dart';

class FancyIntroCarouselSliderItem extends StatelessWidget {
  const FancyIntroCarouselSliderItem({
    super.key,
    required this.item,
    required this.itemCount,
    required this.pageindexStream,
    required this.dotHeight,
    required this.activeDot,
    required this.disabledDot,
    required this.innerPadding,
    required this.actionButton,
  });

  /// Used for defining single item to [PageView.builder]
  final Widget item;

  /// Defined itemCount with [int]
  final int itemCount;

  /// Implemented pageIndexStream for changing page indexes [Stream]
  final Stream<int> pageindexStream;

  /// Used to define dot height in slider dots with [double]
  final double dotHeight;

  /// Used for defining activeDot [Widget]
  final Widget activeDot;

  /// Used for defining disabledDot [Widget]
  final Widget disabledDot;

  /// Used for assigning innerPadding between slider dots with [EdgeInsetsGeometry]
  final EdgeInsetsGeometry innerPadding;

  /// Used for assigning action button in the last page of slider [Widget]
  final Widget actionButton;

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
              final lastIndex = itemCount - 1;
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
                    itemCount: itemCount,
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
