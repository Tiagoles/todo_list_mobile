import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/entities/apontamento_hora/apontamento_hora.dart';
import 'package:smaservicos/app/ui/core/widgets/timers/stopwatch/stopwatch_widget.dart';

class ApontamentoCard extends StatelessWidget {
  
  final ApontamentoCompleto apontamento;
  
  const ApontamentoCard({
    super.key, required this.apontamento
  });

  @override
  Widget build(BuildContext context) {
    return StopwatchWidget(
      startDate: apontamento.dtHoraInicioApontamento ?? apontamento.dtApontamento,
      endDate: apontamento.dtHoraInicioApontamento != null ? apontamento.dtApontamento : null,
      description: apontamento.evento.dsEvento ?? 'Apontamento sem evento',
    );
  }
}
