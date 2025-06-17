import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';

class AppTextCarousel extends StatefulWidget {
  final List<String> texts;
  final int? viewDuration;
  final Color? bgColor;
  final Color? textColor;
  final IconData? icon;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final String? title;

  const AppTextCarousel({
    super.key,
    required this.texts,
    this.viewDuration,
    this.bgColor,
    this.textColor,
    this.icon,
    this.height,
    this.width,
    this.textStyle,
    this.title,
  });

  @override
  State<AppTextCarousel> createState() => _AppTextCarouselState();
}

class _AppTextCarouselState extends State<AppTextCarousel> {
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startCarousel();
  }

  void startCarousel() {
    if (widget.texts.isNotEmpty) {
      timer = Timer.periodic(Duration(seconds: widget.viewDuration ?? 7), (_) {
        setState(() {
          currentIndex = (currentIndex + 1) % widget.texts.length;
        });
      });
    }
  }

  void stopCarousel() {
    timer?.cancel();
  }

  @override
  void dispose() {
    stopCarousel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    if (widget.texts.isEmpty) return const SizedBox();
    Color bgColor = widget.bgColor ?? kcLightGrey;
    Color fgColor = widget.textColor ?? theme.colorScheme.primary;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: theme.primaryColor),
        ),
        width: widget.width ?? pageSize.width * 0.7,
        height: widget.height ?? pageSize.height * 0.11,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.title!,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: fgColor,
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon ?? FontAwesomeIcons.lightbulb,
                  color: fgColor,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FadeInDownText(
                    key: ValueKey(widget.texts[currentIndex]),
                    currentText: widget.texts[currentIndex],
                    textColor: fgColor,
                    textStyle: widget.textStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FadeInDownText extends StatefulWidget {
  final String currentText;
  final Color textColor;
  final TextStyle? textStyle;

  const FadeInDownText({
    required this.currentText,
    required this.textColor,
    this.textStyle,
    super.key,
  });

  @override
  State<FadeInDownText> createState() => _FadeInDownTextState();
}

class _FadeInDownTextState extends State<FadeInDownText>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.05),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    startAnimation();
  }

  @override
  void didUpdateWidget(covariant FadeInDownText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentText != widget.currentText) {
      startAnimation();
    }
  }

  void startAnimation() {
    controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Opacity(
          opacity: opacityAnimation.value,
          child: Transform.translate(
            offset: offsetAnimation.value,
            child: child,
          ),
        );
      },
      child: Text(
        widget.currentText,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: widget.textStyle ??
            theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: widget.textColor,
              fontStyle: FontStyle.italic,
            ),
      ),
    );
  }
}
