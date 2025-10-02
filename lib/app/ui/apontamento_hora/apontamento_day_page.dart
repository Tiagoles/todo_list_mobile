import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/domain/entities/apontamento_hora/apontamento_hora.dart';
import 'package:smaservicos/app/ui/apontamento_hora/widgets/apontamento_card.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/body_card.dart';
import 'package:smaservicos/app/ui/core/widgets/layouts/simple_bar_layout.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/extensions/date_time_extensions.dart';

class ApontamentoDayPage extends StatefulWidget {

  final List<ApontamentoCompleto> apontamentos;

  const ApontamentoDayPage({
    super.key,
    required this.apontamentos,
  });

  @override
  State<ApontamentoDayPage> createState() => _ApontamentoDayPageState();
}

class _ApontamentoDayPageState extends State<ApontamentoDayPage> {
  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BootstrapButtonWidget(
              icon: TablerIcons.arrow_left,
              type: ButtonType.textButton,
              onPressed: () => Modular.to.pop(),
            ),
            Expanded(child: BodyCard(
                expanded: true,
                icon: TablerIcons.clock,
                title: getTitle(context),
                child: ListView.separated(
                  separatorBuilder: (context, _) => const SizedBox(height: 8),
                  itemCount: widget.apontamentos.length,
                  itemBuilder: (context, index){
                    return ApontamentoCard(apontamento: widget.apontamentos[index]);
                  },
                )
            ))
          ],
        ),
      )
    );
  }

  RichText getTitle(BuildContext context){
    final dtApontamento = widget.apontamentos.first.dtHoraInicioApontamento ?? widget.apontamentos.first.dtApontamento;
    final colors = context.colors;
    final textStyle = context.textTheme.bodyLarge!.copyWith(color: colors.primary, fontWeight: FontWeight.bold);
    final isTheSameDay = dtApontamento.isSameDay(DateTime.now());
    return RichText(
      text: TextSpan(
          children: [
            if(isTheSameDay) ...[
              TextSpan(text: 'HOJE - ', style: textStyle),
            ],
            TextSpan(
                text: dtApontamento.format('EEEE, ').toUpperCase(),
                style: textStyle.copyWith(fontWeight: isTheSameDay ? FontWeight.normal : FontWeight.bold),
            ),
            TextSpan(
                text: dtApontamento.format("dd 'de' MMMM").toUpperCase(),
                style: textStyle.copyWith(fontWeight: FontWeight.normal)
            )
          ]
      ),
    );
  }

}
