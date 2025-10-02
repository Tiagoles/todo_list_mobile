import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/menu/order_menu_dropdown/filter_menu_dropdown.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class InspecaoLancamentoPageHeader extends StatelessWidget {

  final Function(String) onDropdownChange;

  const InspecaoLancamentoPageHeader({
    super.key,
    required this.onDropdownChange
  });

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(TablerIcons.rocket, color: colors.primary, size: 24),
          Expanded(
            child: Text(
              'Meus lançamentos'.toUpperCase(),
              style: textTheme.titleMedium,
            ),
          ),
          FilterMenuDropdown(
            onChange: onDropdownChange,
          )
        ],
      ),
    );
  }
}
