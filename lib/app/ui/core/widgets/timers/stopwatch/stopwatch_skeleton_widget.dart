import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StopwatchSkeletonWidget extends StatelessWidget {

  const StopwatchSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primaryContainer.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: colors.onPrimaryContainer.withValues(alpha: 0.2))
      ),
      child: Shimmer.fromColors(
          highlightColor: colors.primary.withValues(alpha: 0.5),
          baseColor: colors.primary.withValues(alpha: 0.3),
          child: Column(
            children: [
              Container(
                height: 20,
                color: colors.surfaceContainerLowest,
                width: double.infinity,
              ),
              const SizedBox(height: 16),
              Container(
                height: 30,
                color: colors.surfaceContainerLowest,
                width: double.infinity,
              )
            ],
          )
      ),
    );
  }
}
