import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/menu/sidenav/sidenav_item_widget.dart';

class ConfigSidenavWidget extends StatefulWidget {

  const ConfigSidenavWidget({super.key});

  @override
  State<ConfigSidenavWidget> createState() => _ConfigSidenavWidgetState();
}

class _ConfigSidenavWidgetState extends State<ConfigSidenavWidget> {

  @override
  Widget build(BuildContext context) {
    return SidenavItemWidget(
        route: '/configs/',
        icon: TablerIcons.settings,
        title: 'Configurações',
        onTap: () {
          Modular.to.pushNamed('/configs/');
          return;
        }
    );
  }
}
