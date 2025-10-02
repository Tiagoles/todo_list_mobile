import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/inspecao_complementar_formgroup.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/formatters/decimal_text_input_formatter.dart';

class FormInspecaoCorrMaxMedidor extends StatefulWidget {

  final InspecaoComplementarFormGroup formGroup;

  const FormInspecaoCorrMaxMedidor({super.key, required this.formGroup});

  @override
  State<FormInspecaoCorrMaxMedidor> createState() => _FormInspecaoCorrMaxMedidorState();
}

class _FormInspecaoCorrMaxMedidorState extends State<FormInspecaoCorrMaxMedidor> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Label(text: 'Corrente Máx. Medidor'),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: StyledFormField(
                type: TextInputType.number,
                formatters: [
                  DecimalTextInputFormatter(3)
                ],
                formGroup: widget.formGroup,
                name: 'vlCorrenteMaxima',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              )),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerLowest,
                  border: Border(
                    top: BorderSide(color: colors.surfaceContainerHighest),
                    bottom: BorderSide(color: colors.surfaceContainerHighest),
                  )
                ),
                child: Icon(
                    TablerIcons.slash,
                    color: colors.outline,
                    applyTextScaling: true
                ),
              ),
              Expanded(child: StyledFormField(
                type: TextInputType.number,
                formatters: [
                  DecimalTextInputFormatter(3)
                ],
                formGroup: widget.formGroup,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                suffixIcon: TablerIcons.letter_a,
                name: 'vlCorrenteMaximaFim',
              ))
            ],
          ),
        )
      ],
    );
  }
}
