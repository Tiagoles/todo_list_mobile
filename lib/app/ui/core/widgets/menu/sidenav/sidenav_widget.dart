import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/config/widgets/config_sidenav_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/menu/sidenav/sidenav_item_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/menu/sidenav/theme_switch_widget.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/menu/sidenav_lancamentos_item.dart';
import 'package:smaservicos/app/utils/extensions/color_scheme_extension.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class SidenavWidget extends StatelessWidget {

  const SidenavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: context.colors.gradientPrimaryLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo_icon.png',
                    height: 48,
                  ),
                  IconButton(
                    icon: Icon(TablerIcons.x, color: context.colors.onPrimaryContainer),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                spacing: 16,
                children: [
                  SidenavItemWidget(
                      route: '/home/',
                      icon: TablerIcons.layout_2,
                      title: 'Dashboard',
                      onTap: () {
                        Navigator.pop(context);
                        Modular.to.pushNamed('/home/');
                      }
                  ),
                  SidenavLancamentosItem(),
                  SidenavItemWidget(
                    route: '/apontamentos-hora/',
                    icon: TablerIcons.clock,
                    title: 'Eventos Apontados',
                    onTap: () {
                      Navigator.pop(context);
                      Modular.to.pushNamed('/apontamentos-hora/');
                    }
                  ),
                  const ConfigSidenavWidget(),
                  const SizedBox(height:64),
                  SidenavItemWidget(
                      route: '/auth/logout',
                      icon: TablerIcons.logout,
                      title: 'Sair',
                      onTap: () {
                        Modular.to.pushReplacementNamed('/auth/logout');
                      }
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 64),
                    child: Column(
                      spacing: 16,
                      children: [
                        SidenavItemWidget(
                          icon: TablerIcons.refresh,
                          title: 'Reiniciar',
                          route: '/startup',
                          onTap: (){
                            Modular.to.pushNamed('/startup/');
                          },
                        ),
                        const ThemeSwitchWidget(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
