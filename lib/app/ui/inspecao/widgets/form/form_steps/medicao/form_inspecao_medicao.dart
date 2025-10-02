import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/medidor_type.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/medicao/inspecao_medicao_formgroup.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/flex_row.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/grid_responsive_item.dart';
import 'package:smaservicos/app/ui/core/widgets/tabs/tabset.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/medicao/input_relacao_tcs.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/medicao/input_relacao_tps.dart';
import 'medidor_types_forms/medidor_kwh_form.dart';
import 'medidor_types_forms/medidor_kw_form.dart';
import 'medidor_types_forms/medidor_kvarh_form.dart';
import 'detalhes_medidor.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class FormInspecaoMedicao extends StatefulWidget {
  final InspecaoMedicaoFormGroup formGroup;
  final Inspecao inspecao;

  const FormInspecaoMedicao({super.key, required this.formGroup, required this.inspecao});

  @override
  State<FormInspecaoMedicao> createState() => _FormInspecaoMedicaoState();
}

class _FormInspecaoMedicaoState extends State<FormInspecaoMedicao> with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DetalhesMedidor(inspecao: widget.inspecao),
          Divider(color: context.colors.surfaceContainerHigh),
          const SizedBox(height: 8),
          FlexRow(
            children: [
              GridResponsiveItem(
                colSizes: 'col-6 col-xl-4',
                child: InputRelacaoTcs(formGroup: widget.formGroup)
              ),
              GridResponsiveItem(
                colSizes: 'col-6 col-xl-4',
                child: InputRelacaoTps(formGroup: widget.formGroup),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Tabset(
              tabs: [
                TabItem(
                    heading: MedidorType.kwh.description,
                    content: MedidorKwhForm(
                      inspecao: widget.inspecao,
                      formGroup: widget.formGroup.kwh,
                    )
                ),
                TabItem(
                    heading: MedidorType.kvarh.description,
                    content: MedidorKvarhForm(
                      inspecao: widget.inspecao,
                      formGroup: widget.formGroup.kvarh,
                    )
                ),
                TabItem(
                    heading: MedidorType.kw.description,
                    content: MedidorKwForm(
                      inspecao: widget.inspecao,
                      formGroup: widget.formGroup.kw,
                    )
                ),
              ]
          )
        ],
      ),
    );
  }
}
