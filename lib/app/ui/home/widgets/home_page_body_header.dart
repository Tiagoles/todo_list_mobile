import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HomePageBodyHeader extends StatelessWidget {

  const HomePageBodyHeader({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return SliverAppBar(
      leading: Icon(TablerIcons.list_check, color: colors.primary, size: 24),
      titleSpacing: 0,
      centerTitle: true,
      title: Text(
        'Ordens de Inspeção em sua região',
        style: textTheme.titleMedium,
      ),
      pinned: true,
      backgroundColor: colors.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
    );
  }
}
