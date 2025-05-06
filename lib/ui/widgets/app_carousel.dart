import 'dart:async';

import 'package:flutter/material.dart';

class AppCarousel extends StatefulWidget {
  final List<Widget> children;
  final int waitTime;
  final bool autoPlay;
  final bool isScrollable;
  const AppCarousel({
    super.key,
    required this.children,
    this.waitTime = 7,
    this.autoPlay = true,
    this.isScrollable = true,
  });

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  final ScrollController _scrollController = ScrollController();
  Timer? _autoScrollTimer;
  double scrollPosition = 0.0;
  final double _scrollIncrement = 200;

  @override
  void initState() {
    super.initState();
    if (widget.autoPlay && widget.isScrollable) {
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _autoScrollTimer =
        Timer.periodic(Duration(seconds: widget.waitTime), (timer) {
      if (_scrollController.hasClients) {
        setState(() {
          scrollPosition = scrollPosition + _scrollIncrement;
          if (scrollPosition >= _scrollController.position.maxScrollExtent) {
            scrollPosition = 0.0; // If we've reached the end, reset to start
          }
        });

        _scrollController.animateTo(
          scrollPosition,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      physics: widget.isScrollable
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.children,
      ),
    );
  }
}
