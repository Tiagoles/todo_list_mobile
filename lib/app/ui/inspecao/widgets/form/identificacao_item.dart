import 'package:flutter/material.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class IdentificacaoItem extends StatelessWidget {

  final String label;
  final String data;

  const IdentificacaoItem({
    super.key,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            label,
            style: context.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurfaceVariant)
        ),
        Expanded(child: Text(data))
      ],
    );
  }
}
