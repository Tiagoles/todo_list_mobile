import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ConfigLayoutHeaderWidget extends StatelessWidget {

  final VoidCallback onReturn;

  const ConfigLayoutHeaderWidget({
    super.key,
    required this.onReturn
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Container(
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
      padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 32,
          bottom: 16
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        children: [
          IconButton(
            icon: Icon(
              TablerIcons.arrow_left,
              color: colors.primary,
            ),
            onPressed: onReturn,
          ),
          Text('Configurações', style: textTheme.titleMedium)
        ],
      ),
    );
  }
}
