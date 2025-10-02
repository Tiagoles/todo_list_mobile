import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/badges/alert_badge.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/inspecao_viewmodel.dart';

class SidenavLancamentosItem extends StatefulWidget {

  final InspecaoViewModel viewmodel = Modular.get();
  final String route = '/inspecao/lancamentos';

  SidenavLancamentosItem({super.key});

  @override
  State<SidenavLancamentosItem> createState() => _SidenavLancamentosItemWidget();
}

class _SidenavLancamentosItemWidget extends State<SidenavLancamentosItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;
  late final appTheme = Theme.of(context);
  late bool isAble = true;

  @override
  void initState() {
    super.initState();
    isAble = Uri.parse(Modular.to.path).path != widget.route;
    Modular.to.path;
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this
    );
  }

  void _updateTheme(){
    if(!mounted) return;
    final colors = Theme.of(context).colorScheme;
    _animation = ColorTween(
        begin: colors.primaryContainer.withValues(alpha: 0),
        end: colors.primaryContainer.withValues(alpha: 0.8)
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _updateTheme();
    final colors = Theme.of(context).colorScheme;
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                  color: isAble ? _animation.value : colors.primaryContainer.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(4)
              ),
              child: ListTile(
                leading: Icon(TablerIcons.rocket, color: colors.tertiaryContainer),
                title: Align(
                  alignment: Alignment.topLeft,
                  child: Observer(builder: (context){
                    final child = Text(
                      'Lançamentos',
                      style: appTheme.textTheme.bodyLarge!.apply(color: colors.onPrimaryContainer),
                    );

                    if(widget.viewmodel.countReleases > 0){
                      return AlertBadge(
                          text: widget.viewmodel.countReleases.toString(),
                          child: child
                      );
                    }

                    return child;
                  }),
                ),
                onTap: !isAble ? null : () {
                  _controller.forward().whenCompleteOrCancel(() {
                    _controller.reverse();
                    Modular.to.pushNamed(widget.route);
                  });
                },
              ),
            ),
          );
        }
    );
  }

}
