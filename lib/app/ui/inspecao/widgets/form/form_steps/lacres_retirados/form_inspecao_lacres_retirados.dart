import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/inspecao_lacres_retirados_formgroup.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/text_inputs/dynamic_form_field.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/flex_row.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/grid_responsive_item.dart';

class FormInspecaoLacresRetirados extends StatefulWidget {
  final InspecaoLacresRetiradosFormGroup formGroup;

  const FormInspecaoLacresRetirados({super.key, required this.formGroup});

  @override
  State<FormInspecaoLacresRetirados> createState() => _FormInspecaoLacresRetiradosState();
}

class _FormInspecaoLacresRetiradosState extends State<FormInspecaoLacresRetirados> with AutomaticKeepAliveClientMixin {

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
                  'vlLacreRetPadAtivo1',
                  'vlLacreRetPadAtivo2',
                  'vlLacreRetPadAtivo3',
                  'vlLacreRetPadAtivo4',
                ],
                label: 'Cx. Medidor Ativo'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetPadReativo1',
                  'vlLacreRetPadReativo2',
                  'vlLacreRetPadReativo3',
                  'vlLacreRetPadReativo4',
                ],
                label: 'Cx. Medidor Reativo'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetTcs1',
                  'vlLacreRetTcs2',
                  'vlLacreRetTcs3',
                  'vlLacreRetTcs4',
                ],
                label: 'Cx. Medidor TC'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetBorne1',
                  'vlLacreRetBorne2',
                  'vlLacreRetBorne3',
                  'vlLacreRetBorne4',
                ],
                label: 'Borne'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetCxBarram1',
                  'vlLacreRetCxBarram2',
                  'vlLacreRetCxBarram3',
                  'vlLacreRetCxBarram4',
                ],
                label: 'Cx. Barramento'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetCaixaDeriva1',
                  'vlLacreRetCaixaDeriva2'
                ],
                label: 'Cx. Derivação'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetChaveProtec1',
                  'vlLacreRetChaveProtec2'
                ],
                label: 'Proteção'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetChaveAfer1',
                  'vlLacreRetChaveAfer2'
                ],
                label: 'Chave Aferição'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetDemanda',
                ],
                label: 'Demanda'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetPortaOptica',
                ],
                label: 'Porta Óptica'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetCubiculo1',
                  'vlLacreRetCubiculo2',
                ],
                label: 'Cubículo'
            ),
          ),
          GridResponsiveItem(
            colSizes: 'col-6 col-xl-4',
            child: DynamicFormField(
                formGroup: widget.formGroup,
                fieldNames: const [
                  'vlLacreRetDisplay',
                ],
                label: 'Display'
            ),
          ),
        ],
      ),
    );
  }
}
