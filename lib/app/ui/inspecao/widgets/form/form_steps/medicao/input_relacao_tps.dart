import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/medicao/inspecao_medicao_formgroup.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class InputRelacaoTps extends StatefulWidget {

  final InspecaoMedicaoFormGroup formGroup;

  const InputRelacaoTps({super.key, required this.formGroup});

  @override
  State<InputRelacaoTps> createState() => _InputRelacaoTpsState();
}

class _InputRelacaoTpsState extends State<InputRelacaoTps> with AutomaticKeepAliveClientMixin {

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
        const Label(text: 'T.P'),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: StyledFormField(
                type: TextInputType.number,
                formGroup: widget.formGroup,
                name: 'vlTp1',
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
                formGroup: widget.formGroup,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                name: 'vlTp2',
              ))
            ],
          ),
        )
      ],
    );
  }
}
