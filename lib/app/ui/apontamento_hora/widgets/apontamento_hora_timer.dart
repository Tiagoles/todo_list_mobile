import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/plugins/modal_actions.dart';
import 'package:smaservicos/app/ui/apontamento_hora/data/apontamento_completos.dart';
import 'package:smaservicos/app/ui/apontamento_hora/widgets/apontamento_hora_form.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/core/widgets/timers/stopwatch/stopwatch_widget.dart';

class ApontamentoHoraTimer extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  ApontamentoHoraTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final apontamento = apontamentosMock.last;
    return StopwatchWidget(
      startDate: apontamento.dtApontamento,
      description: apontamento.evento.dsEvento ?? 'Apontamento sem evento',
      onTap: () => Modular.to.pushNamed('/apontamentos-hora'),
      onPlayerTap: (){
        ModalActions.showAlertBottomSheet(
          context,
          title: 'Selecione o evento',
          content: ApontamentoHoraForm(formKey: _formKey),
          actions: [
            BootstrapButtonWidget(
              text: 'Fechar',
              color: ButtonColor.primary,
              type: ButtonType.textButton,
              icon: TablerIcons.x,
              onPressed: (){
                Modular.to.pop();
              },
            ),
            BootstrapButtonWidget(
              text: 'Confirmar',
              icon: TablerIcons.check,
              onPressed: _formKey.currentState!.validate() ? (){} : null,
            )
          ]
        );
      },
    );
  }

}