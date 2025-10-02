import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/inspecao_lacres_adicionados_formgroup.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/text_inputs/dynamic_form_field.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/flex_row.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/grid_responsive_item.dart';

class FormInspecaoLacresAdicionados extends StatefulWidget {
  final InspecaoLacresAdicionadosFormGroup formGroup;

  const FormInspecaoLacresAdicionados({super.key, required this.formGroup});

  @override
  State<FormInspecaoLacresAdicionados> createState() => _FormInspecaoLacresAdicionadosState();
}

class _FormInspecaoLacresAdicionadosState extends State<FormInspecaoLacresAdicionados> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FlexRow(
        children: [
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacAdicPadAtivo1',
                  'vlLacAdicPadAtivo2',
                  'vlLacAdicPadAtivo3',
                  'vlLacAdicPadAtivo4',
                ],
                label: 'Cx. Medidor Ativo'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacAdicPadReativo1',
                  'vlLacAdicPadReativo2',
                  'vlLacAdicPadReativo3',
                  'vlLacAdicPadReativo4',
                ],
                label: 'Cx. Medidor Reativo'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreAdicTcs1',
                  'vlLacreAdicTcs2',
                  'vlLacreAdicTcs3',
                  'vlLacreAdicTcs4',
                ],
                label: 'Cx. Medidor TC'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreAdicBorne1',
                  'vlLacreAdicBorne2',
                  'vlLacreAdicBorne3',
                  'vlLacreAdicBorne4',
                ],
                label: 'Borne'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreAdicCxBarram1',
                  'vlLacreAdicCxBarram2',
                  'vlLacreAdicCxBarram3',
                  'vlLacreAdicCxBarram4',
                ],
                label: 'Cx. Barramento'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacAdicCxDeriva1',
                  'vlLacAdicCxDeriva2'
                ],
                label: 'Cx. Derivação'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacAdicChaveProt1',
                  'vlLacAdicChaveProt2'
                ],
                label: 'Proteção'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreAdicChaveAfer1',
                  'vlLacreAdicChaveAfer2'
                ],
                label: 'Chave Aferição'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreAdicDemanda',
                ],
                label: 'Demanda'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreAdicPortaOptica',
                ],
                label: 'Porta Óptica'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreAdicCubiculo1',
                  'vlLacreAdicCubiculo2',
                ],
                label: 'Cubículo'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreAdicDisplay',
                ],
                label: 'Display'
            ),
          ),
        ],
      ),
    );
  }
}
