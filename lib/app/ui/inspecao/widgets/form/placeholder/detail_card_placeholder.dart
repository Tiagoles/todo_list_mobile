import 'package:flutter/material.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class DetailCardPlaceholder extends StatelessWidget {
  final int lineNumbers;
  const DetailCardPlaceholder({super.key, this.lineNumbers = 1});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: colors.primaryContainer
          ),
        ),
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                height: 10,
                color: Colors.black,
              ),
            ),
            ...List.generate(
              lineNumbers,
              (index) => Container(
                height: 12,
                color: Colors.black,
              ),
            ),
          ],
        )
    );
  }
}
