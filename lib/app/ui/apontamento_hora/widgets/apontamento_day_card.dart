import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/domain/entities/apontamento_hora/apontamento_hora.dart';
import 'package:smaservicos/app/utils/extensions/color_scheme_extension.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/extensions/date_time_extensions.dart';

class ApontamentoDayCard extends StatelessWidget {

  final List<ApontamentoCompleto> apontamentos;

  const ApontamentoDayCard({
    super.key,
    required this.apontamentos
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textTheme.titleMedium!.copyWith(color: colors.onPrimaryContainer);
    return InkWell(
      onTap: (){
        Modular.to.pushNamed(('/apontamentos-hora/dia'), arguments: apontamentos);
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: colors.gradientPrimaryLight,
            borderRadius: BorderRadius.circular(4)
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            formattedDate(textStyle),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Total: ',
                    style: textStyle.copyWith(fontWeight: FontWeight.normal, color: colors.onPrimaryContainer),
                  ),
                  TextSpan(text: duration, style: textStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get duration{
    final d = apontamentos.fold(Duration.zero, (prev, e){
      return prev + e.duration;
    });
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  RichText formattedDate(TextStyle style) {
    final dtApontamento = apontamentos.first.dtHoraInicioApontamento ?? apontamentos.first.dtApontamento;
    final formatted = dtApontamento.format('dd/MM/yyyy');
    if (formatted == DateTime.now().format('dd/MM/yyyy')) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$formatted ',
              style: style.copyWith(fontWeight: FontWeight.normal),
            ),
            TextSpan(text: '(Hoje)', style: style),
          ],
        ),
      );
    }
    return RichText(
      text: TextSpan(text: formatted, style: style),
    );
  }
}
