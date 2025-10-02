import 'package:flutter/material.dart';

class StopwatchClockWidget extends StatelessWidget {
  final String hours;
  final String minutes;
  final String seconds;

  const StopwatchClockWidget({
    super.key,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
            hours,
            style: textTheme.titleLarge!.apply(color: colors.onPrimaryContainer)
        ),
        ..._divider(context),
        Text(
            minutes,
            style: textTheme.titleLarge!.apply(color: colors.onPrimaryContainer)
        ),
        ..._divider(context),
        Text(
            seconds,
            style: textTheme.titleLarge!.apply(color: colors.onPrimaryContainer)
        ),
      ],
    );
  }

  List<Widget> _divider(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return [
      const SizedBox(width: 8),
      Text(
    ':',
        style: textTheme.titleLarge!.apply(color: colors.onPrimaryContainer),
      ),
      const SizedBox(width: 8),
    ];
  }

}
