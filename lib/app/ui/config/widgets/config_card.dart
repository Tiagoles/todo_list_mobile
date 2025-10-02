import 'package:flutter/material.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class ConfigCard extends StatelessWidget {

  final Widget child;

  const ConfigCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: colors.surfaceContainerLowest,
          border: Border.all(
              color: colors.surfaceContainerHighest
          )
      ),
      child: child
    );
  }
}
