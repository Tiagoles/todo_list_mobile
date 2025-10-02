import 'package:flutter/material.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:flutter/scheduler.dart';

class CircularTimerProgressWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final double? fontSize;
  final VoidCallback inTheEnd;
  final int remainingTime;

  const CircularTimerProgressWidget({
    super.key,
    this.width,
    this.height,
    this.fontSize,
    required this.inTheEnd,
    this.remainingTime = 10,
  });

  @override
  State<CircularTimerProgressWidget> createState() =>
      _CircularTimerProgressWidgetState();
}

class _CircularTimerProgressWidgetState extends State<CircularTimerProgressWidget>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  late final int _totalSeconds;
  late Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _totalSeconds = widget.remainingTime;
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration elapsed) {
    setState(() {
      _elapsed = elapsed;
    });

    if (elapsed.inSeconds >= _totalSeconds) {
      _ticker.stop();
      widget.inTheEnd();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final widthScreen = context.screenWidth;
    final colors = Theme.of(context).colorScheme;

    final width = widget.width ?? widthScreen * 0.3;
    final height = widget.height ?? widthScreen * 0.3;
    final remaining = (_totalSeconds - _elapsed.inSeconds).clamp(0, _totalSeconds);
    final progress = 1 - (_elapsed.inMilliseconds / (_totalSeconds * 1000)).clamp(0.0, 1.0);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
              width: width,
              height: height,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 5,
                backgroundColor: colors.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(colors.primaryContainer),
              ),
            ),
          ),
          Text(
            '$remaining',
            style: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: colors.primaryContainer,
              fontSize: widget.fontSize ?? widthScreen * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
