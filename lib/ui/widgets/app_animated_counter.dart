import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';

class AppAnimatedCounter extends StatefulWidget {
  final double valueToAnimate;
  final TextStyle? textStyle;
  final int? startValue;
  final List<TextSpan>? preTexts;
  final List<TextSpan>? postTexts;
  final int durationInUs;
  final bool useWantKeepAlive;

  const AppAnimatedCounter({
    super.key,
    required this.valueToAnimate,
    this.textStyle,
    this.startValue,
    this.durationInUs = 1,
    this.preTexts,
    this.postTexts,
    this.useWantKeepAlive = true,
  });

  @override
  State<AppAnimatedCounter> createState() => _AppAnimatedCounterState();
}

class _AppAnimatedCounterState extends State<AppAnimatedCounter>
    with AutomaticKeepAliveClientMixin {
  bool _isAnimating = true;
  double currentVal = 0;

  @override
  void initState() {
    super.initState();
    runAnimation();
  }

  @override
  void didUpdateWidget(covariant AppAnimatedCounter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.valueToAnimate != widget.valueToAnimate) {
      runAnimation();
    }
  }

  void runAnimation() async {
    int start = widget.startValue ?? (widget.valueToAnimate * 0.99).ceil();
    if (!_isAnimating || !mounted) return;

    setState(() {
      currentVal = start.toDouble();
    });

    for (int i = start; i <= widget.valueToAnimate; i++) {
      await Future.delayed(Duration(microseconds: widget.durationInUs));
      setState(() {
        currentVal = i.toDouble();
      });
    }

    if (_isAnimating && mounted) {
      setState(() {
        currentVal = widget.valueToAnimate.toDouble();
      });
    }
  }

  @override
  void dispose() {
    _isAnimating = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return Text.rich(
      TextSpan(
        children: [
          if (widget.preTexts != null) ...widget.preTexts!,
          TextSpan(
            text: addThousandSeparators(
              currentVal.toDouble(),
              showDecimals: true,
              decimalPlaces: 1,
            ),
            style: widget.textStyle ??
                theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (widget.postTexts != null) ...widget.postTexts!,
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.useWantKeepAlive;
}
