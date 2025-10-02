import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/inspecao_form_steps.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/inspecao_formgroup.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/acoes_tomadas/form_inspecao_acoes_tomadas.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/complementar/form_inspecao_complementar.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/identificacao/form_inspecao_identificacao.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/irregularidades/form_inspecao_irregularidades.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/itens_inspecionados/form_inspecao_itens_inspecionados.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/lacres_adicionados/form_inspecao_lacres_adicionados.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/lacres_retirados/form_inspecao_lacres_retirados.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/medicao/form_inspecao_medicao.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/observacoes/form_inspecao_observacoes.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/return_button/return_form.dart';
import 'package:smaservicos/app/utils/command.dart';

class InspecaoFormStepsView extends StatelessWidget {

  final Inspecao inspecao;
  final GlobalKey<FormState> formKey;
  final Command2<Unit, ReturnFormGroup, GlobalKey<FormState>> returnCommand;
  final PageController pageController;
  final InspecaoFormGroup formGroup;
  final FormControl<int, int> stepControl;

  const InspecaoFormStepsView({
    super.key,
    required this.formKey,
    required this.inspecao,
    required this.pageController,
    required this.formGroup,
    required this.stepControl,
    required this.returnCommand,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: PageView.builder(
        pageSnapping: true,
        controller: pageController,
        itemCount: InspecaoFormSteps.values.length,
        onPageChanged: (index) {
          if (stepControl.value != index) {
            stepControl.setValue(index);
          }
        },
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return SingleChildScrollView(child: FormInspecaoIdentificacao(inspecao: inspecao, returnCommand: returnCommand));
            case 1:
              return SingleChildScrollView(child: FormInspecaoLacresRetirados(formGroup: formGroup.lacresRetirados));
            case 2:
              return SingleChildScrollView(child: FormInspecaoMedicao(formGroup: formGroup.medicao, inspecao: inspecao));
            case 3:
              return SingleChildScrollView(child: FormInspecaoComplementar(formGroup: formGroup.complementar));
            case 4:
              return FormInspecaoItensInspecionados(formGroup: formGroup.itensInspecionados);
            case 5:
              return FormInspecaoIrregularidades(formGroup: formGroup.irregularidades);
            case 6:
              return FormInspecaoAcoesTomadas(formGroup: formGroup.acoesTomadas);
            case 7:
              return SingleChildScrollView(child: FormInspecaoLacresAdicionados(formGroup: formGroup.lacresAdicionados));
            case 8:
              return SingleChildScrollView(child: FormInspecaoObservacoes(formGroup: formGroup.observacoes));
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
