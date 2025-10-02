import 'package:flutter/material.dart';
import 'package:smaservicos/app/ui/apontamento_hora/widgets/apontamento_hora_timer.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class FormHeaderWidget extends StatelessWidget {

  final String title;

  const FormHeaderWidget({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: colors.surfaceContainerLowest,
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: colors.surfaceContainerHighest,
                      width: 1
                  )
              )
          ),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  title,
                  style: textTheme.titleLarge,
                ),
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ApontamentoHoraTimer(),
        )
      ],
    );
  }
}
