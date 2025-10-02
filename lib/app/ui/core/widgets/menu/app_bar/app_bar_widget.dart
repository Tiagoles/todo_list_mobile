import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/utils/extensions/color_scheme_extension.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: context.colors.gradientPrimaryLight
      ),
      child: AppBar(
          centerTitle: true,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('assets/images/horizontal_logo.png', height: 64, fit: BoxFit.contain),
          ),
          leading: IconButton(
            color: context.colors.onPrimaryContainer,
            icon: const Icon(TablerIcons.menu_2),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          backgroundColor: Colors.transparent
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(84);
}
