import 'package:flutter/material.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';

class AppAnimatedCounter extends StatefulWidget {
  final int valueToAnimate;
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
  int currentVal = 0;

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
    setState(() {
      currentVal = start;
    });
    for (int i = start; i <= widget.valueToAnimate; i++) {
      await Future.delayed(Duration(microseconds: widget.durationInUs));
      setState(() {
        currentVal = i;
      });
    }
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
            text: addThousandSeparators(currentVal.toDouble()),
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
