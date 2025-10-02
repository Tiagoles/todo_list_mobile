import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/apontamento_hora/viewmodels/apontamento_hora_viewmodel.dart';
import 'package:smaservicos/app/ui/apontamento_hora/widgets/apontamento_week_card.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/core/widgets/layouts/simple_bar_layout.dart';
import 'package:smaservicos/app/utils/date_utils.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class ApontamentoWeekPage extends StatefulWidget {

  final ApontamentoHoraViewModel viewModel;

  final yearsAndWeeks = MyDateUtils.getYearsAndWeeks((DateTime.now().year - 1), (DateTime.now().year + 1));

  ApontamentoWeekPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<ApontamentoWeekPage> createState() => _ApontamentoWeekPageState();
}

class _ApontamentoWeekPageState extends State<ApontamentoWeekPage> {
  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return SimpleBarLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Botão de voltar à esquerda
                BootstrapButtonWidget(
                  icon: TablerIcons.arrow_left,
                  type: ButtonType.textButton,
                  onPressed: () => Modular.to.pop(),
                ),

                // Título centralizado
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(TablerIcons.clock, color: colors.primary, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      'Apontamentos',
                      style: textTheme.titleLarge,
                    ),
                  ],
                ),

                // Espaçador do mesmo tamanho do botão, para manter centralizado
                Opacity(
                  opacity: 0,
                  child: BootstrapButtonWidget(
                    icon: TablerIcons.arrow_left,
                    type: ButtonType.textButton,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Expanded(child: Observer(
                builder: (context){
                  final entries = widget.viewModel.perWeek.entries.toList();
                  return ListView.separated(
                    itemCount: entries.length,
                    separatorBuilder: (_,_) => const SizedBox(height: 8),
                    itemBuilder: (context, index){
                      final entry = entries[index];
                      return ApontamentoWeekCard(
                          weekOfYear: entry.key,
                          apontamentosPorDia: entry.value,
                          yearsAndWeeks: widget.yearsAndWeeks
                      );
                    },
                  );
                }
            ))
          ],
        ),
      )
    );
  }
}
