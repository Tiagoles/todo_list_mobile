import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';

class ConfigLayoutFooterWidget extends StatelessWidget {

  final VoidCallback onCancel;
  final VoidCallback onSave;

  const ConfigLayoutFooterWidget({
    super.key,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: colors.surfaceContainerLowest,
          border: BorderDirectional(
              top: BorderSide(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BootstrapButtonWidget(
            icon: TablerIcons.x,
            type: ButtonType.textButton,
            color: ButtonColor.dark,
            text: 'Cancelar',
            onPressed: onCancel,
          ),
          BootstrapButtonWidget(
              icon: TablerIcons.device_floppy,
              text: 'Salvar',
              onPressed: onSave
          )
        ],
      ),
    );
  }
}
