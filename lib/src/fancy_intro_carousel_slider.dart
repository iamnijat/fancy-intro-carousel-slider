// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'fancy_intro_carousel_slider_item.dart';

class FancyIntroCarouselSlider extends StatefulWidget {
  const FancyIntroCarouselSlider({
    super.key,
    required this.items,
    required this.dotHeight,
    required this.activeDot,
    required this.disabledDot,
    required this.innerPadding,
    required this.actionButton,
    this.sliderKey,
    required this.pageController,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    this.physics,
    this.pageSnapping = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
    this.padEnds = true,
  });

  /// Used to define carousel items in [PageView.builder]
  final List<Widget> items;

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

  /// Optional to use for uniqueness [Key]
  final Key? sliderKey;

  /// Implemented [PageController] to apply logic for switching pages
  final PageController pageController;

  /// Optional to change scrollDirection of [PageView.builder]
  final Axis scrollDirection;

  /// Optional to change reverse parameter of [PageView.builder]
  final bool reverse;

  /// Used for assigning pyhsics to [PageView.builder]
  final ScrollPhysics? physics;

  /// Optional to change pageSnapping parameter of [PageView.builder]
  final bool pageSnapping;

  /// Optional to change [DragStartBehavior] parameter of [PageView.builder]
  final DragStartBehavior dragStartBehavior;

  /// Optional to change allowImplicitScrolling parameter of [PageView.builder]
  final bool allowImplicitScrolling;

  /// Used for assigning restorationId to [PageView.builder]
  final String? restorationId;

  /// Optional to change clipBehavior [Clip] parameter of [PageView.builder]
  final Clip clipBehavior;

  /// Used for assigning [ScrollBehavior] to [PageView.builder]
  final ScrollBehavior? scrollBehavior;

  /// Optional to change padEnds parameter of [PageView.builder]
  final bool padEnds;

  @override
  State<FancyIntroCarouselSlider> createState() =>
      _FancyIntroCarouselSliderState();
}

class _FancyIntroCarouselSliderState extends State<FancyIntroCarouselSlider> {
  /// [StreamController] for controlling visibility
  final _pageIndexStream = StreamController<int>.broadcast();

  /// [Int] for defining current page value
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _initPageController();
  }

  /// initialize pageChanged method.
  void onPageChanged(int index) => _currentPage = index;

  /// changing the pageIndexStream value
  onPageControllerChange(int index) => _pageIndexStream.sink.add(index);

  /// initialize page controller method.
  void _initPageController() {
    onPageControllerChange(0);
    widget.pageController
        .addListener(() => onPageControllerChange(_currentPage));
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        key: widget.sliderKey,
        scrollBehavior: widget.scrollBehavior,
        allowImplicitScrolling: widget.allowImplicitScrolling,
        clipBehavior: widget.clipBehavior,
        padEnds: widget.padEnds,
        restorationId: widget.restorationId,
        dragStartBehavior: widget.dragStartBehavior,
        pageSnapping: widget.pageSnapping,
        reverse: widget.reverse,
        scrollDirection: widget.scrollDirection,
        physics: widget.physics,
        controller: widget.pageController,
        onPageChanged: onPageChanged,
        itemCount: widget.items.length,
        itemBuilder: (ctx, i) => FancyIntroCarouselSliderItem(
              item: widget.items[i],
              itemCount: widget.items.length,
              pageindexStream: _pageIndexStream.stream,
              disabledDot: widget.disabledDot,
              activeDot: widget.activeDot,
              innerPadding: widget.innerPadding,
              dotHeight: widget.dotHeight,
              actionButton: widget.actionButton,
            ));
  }

  @override
  void dispose() {
    _pageIndexStream.close();
    widget.pageController.dispose();
    super.dispose();
  }
}
