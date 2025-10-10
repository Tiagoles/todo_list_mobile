import 'package:flutter/material.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import '../../../domain/enums/prioridade_enum.dart';

class PriorityLegendWidget extends StatelessWidget {
  const PriorityLegendWidget({super.key});

  String _formatPriorityName(String name) {
    final result = name
        .replaceAllMapped(
      RegExp(r'([A-Z])'),
          (match) => ' ${match.group(0)!.toLowerCase()}',
    )
        .trim();

    return result.isEmpty ? '' : result[0].toUpperCase() + result.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);

     const itemsPerColumn = 2;

    final prioridades = PrioridadeEnum.values;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
           final crossAxisCount = (prioridades.length / itemsPerColumn).ceil();

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: prioridades.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 2,
              crossAxisSpacing: 8,
              childAspectRatio: 4,
            ),
            itemBuilder: (context, index) {
              final prioridade = prioridades[index];
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: prioridade.color(context),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: colors.inversePrimary.withAlpha(100),
                        width: 1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      _formatPriorityName(prioridade.name),
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
