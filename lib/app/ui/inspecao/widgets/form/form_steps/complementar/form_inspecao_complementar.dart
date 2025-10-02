import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/inspecao_complementar_formgroup.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/flex_row.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/grid_responsive_item.dart';
import 'package:smaservicos/app/ui/core/widgets/selects/select.dart';
import 'package:smaservicos/app/utils/formatters/decimal_text_input_formatter.dart';
import 'form_inspecao_corr_max_medidor.dart';

class FormInspecaoComplementar extends StatefulWidget {
  
  final InspecaoComplementarFormGroup formGroup;
  
  const FormInspecaoComplementar({
    super.key,
    required this.formGroup,
  });

  @override
  State<FormInspecaoComplementar> createState() => _FormInspecaoComplementarState();
}

class _FormInspecaoComplementarState extends State<FormInspecaoComplementar> with AutomaticKeepAliveClientMixin {

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
            colSizes: 'col-12 col-md-6 col-xl-4',
            child: FormInspecaoCorrMaxMedidor(formGroup: widget.formGroup)
          ),
          GridResponsiveItem(
            colSizes: 'col-12 col-md-6 col-xl-4',
            child: StyledFormField(
              type: TextInputType.number,
              formatters: [
                DecimalTextInputFormatter(3)
              ],
              labelText: 'Corrente Disjuntor',
              formGroup: widget.formGroup,
              name: 'vlCorrenteDisjuntor',
              suffixIcon: TablerIcons.letter_a,
            )
          ),
          GridResponsiveItem(
            colSizes: 'col-12 col-md-6 col-xl-4',
            child: StyledFormField(
              type: TextInputType.number,
              formatters: [
                DecimalTextInputFormatter(3)
              ],
              formGroup: widget.formGroup,
              name: 'vlChaveProtecao',
              labelText: 'Proteção',
              suffixIcon: TablerIcons.letter_a,
            )
          ),
          GridResponsiveItem(
            colSizes: 'col-12 col-md-6 col-xl-4',
            child: Select(
              label: 'Cond. Eletroduto',
              formGroup: widget.formGroup,
              name: 'vlCaboEntrada',
              options: [
                Option(null, 'Selecione'),
                Option('6', '6'),
                Option('10', '10'),
                Option('16', '16'),
                Option('25', '25'),
                Option('35', '35'),
                Option('50', '50'),
                Option('70', '70'),
                Option('95', '95'),
                Option('120', '120'),
                Option('2x95', '2x95'),
                Option('2x120', '2x120'),
                Option('2x140', '2x140'),
                Option('150', '150'),
              ],
            )
          ),
        ],
      ),
    );
  }
}


