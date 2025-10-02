import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/domain/entities/apontamento_hora/apontamento_hora.dart';
import 'package:smaservicos/app/ui/apontamento_hora/widgets/apontamento_day_card.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/body_card.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/extensions/date_time_extensions.dart';

class ApontamentoWeekCard extends StatelessWidget {

  final Map<DateTime, List<ApontamentoCompleto>> apontamentosPorDia;
  final int weekOfYear;
  final Map<int, Map<int, DateTimeRange>> yearsAndWeeks;

  const ApontamentoWeekCard({
    super.key,
    required this.apontamentosPorDia,
    required this.weekOfYear,
    required this.yearsAndWeeks,
  });

  @override
  Widget build(BuildContext context) {
    return BodyCard(
      icon: TablerIcons.calendar_event,
      expanded: false,
      title: getWeekText(context),
      child: Column(
        spacing: 8,
        children: apontamentosPorDia.entries.map((e) => ApontamentoDayCard(
          apontamentos: e.value,
        )).toList(),
      ),
    );
  }

  RichText getWeekText(BuildContext context){
    final (colors, textTheme) = (context.colors, context.textTheme);
    final textStyle = textTheme.bodyLarge!.apply(color: colors.primary.withAlpha(200));
    final interval = getInterval(apontamentosPorDia.keys.first.year);
    return RichText(
      text: TextSpan(
        children: [
          if(weekOfYear == DateTime.now().weekOfYear) ...[
            TextSpan(
              text: 'Esta Semana - '.toUpperCase(),
              style: textStyle.copyWith(fontWeight: FontWeight.bold)
            )
          ],
          if(weekOfYear == (DateTime.now().weekOfYear-1)) ...[
            TextSpan(
                text: 'Sem. passada - '.toUpperCase(),
                style: textStyle.copyWith(fontWeight: FontWeight.bold)
            )
          ],
          TextSpan(
            text: '${interval.start.format("dd 'de' MMM")} - ${interval.end.format("dd 'de' MMM")}',
            style: textStyle
          )
        ]
      ),
    );
  }

  DateTimeRange getInterval(int year){
    return yearsAndWeeks[year]![weekOfYear]!;
  }

}
