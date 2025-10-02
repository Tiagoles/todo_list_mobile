import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/fase/fase.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/datails_card/details_card_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/flex_row.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/grid_responsive_item.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/return_button/return_form.dart';
import 'package:smaservicos/app/utils/command.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class FormInspecaoIdentificacao extends StatefulWidget {

  final Inspecao inspecao;
  final Command2<Unit, ReturnFormGroup, GlobalKey<FormState>> returnCommand;

  const FormInspecaoIdentificacao({
    super.key,
    required this.inspecao,
    required this.returnCommand
  });

  @override
  State<FormInspecaoIdentificacao> createState() => _FormInspecaoIdentificacaoState();
}

class _FormInspecaoIdentificacaoState extends State<FormInspecaoIdentificacao> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.inspecao.dsConsumidor?.toUpperCase() ?? 'N/A',
                style: context.textTheme.titleLarge,
              ),
              Divider(color: colors.surfaceContainerHigh),
              const SizedBox(height: 8),
              FlexRow(
                  children: [
                    GridResponsiveItem(
                        child: Text('DADOS DA INSPEÇÃO', style: textTheme.labelSmall!.apply(color: colors.primary))
                    ),
                    GridResponsiveItem(
                        child: DetailsCardWidget(
                          title: 'N° Inspeção',
                          text: widget.inspecao.nrInspecao.toInt().toString(),
                        )
                    ),
                    GridResponsiveItem(
                        child: DetailsCardWidget(title: 'Obs:', text: widget.inspecao.dsObservacaoMotivo)
                    ),
                    GridResponsiveItem(
                        child: Text('CONSUMIDOR', style: textTheme.labelSmall!.apply(color: colors.primary))
                    ),
                    GridResponsiveItem(
                        colSizes: 'col-6',
                        child: DetailsCardWidget(
                          title: 'CPF/CNPJ',
                          text:  widget.inspecao.formattedDoc,
                        )
                    ),
                    GridResponsiveItem(
                        colSizes: 'col-6',
                        child: DetailsCardWidget(title: 'I.E.:', text: widget.inspecao.nrIe)
                    ),
                    GridResponsiveItem(
                        child: Text('UNIDADE CONSUMIDORA', style: textTheme.labelSmall!.apply(color: colors.primary))
                    ),
                    GridResponsiveItem(
                        colSizes: 'col-6',
                        child: DetailsCardWidget(
                          title: 'Cód. UC',
                          text: widget.inspecao.cdUnConsumidora.toInt().toString(),
                        )
                    ),
                    GridResponsiveItem(
                        colSizes: 'col-6',
                        child: DetailsCardWidget(
                          title: 'Posto Transf.',
                          text:  widget.inspecao.dsPostoTransformador ?? 'N/A',
                        )
                    ),
                    GridResponsiveItem(
                        colSizes: 'col-12',
                        child: DetailsCardWidget(
                          title: 'Endereço',
                          text: widget.inspecao.address,
                        )
                    ),
                    GridResponsiveItem(
                        colSizes: 'col-6',
                        child: DetailsCardWidget(title: 'Classe:', text: widget.inspecao.dsClasse ?? 'N/A')
                    ),
                    GridResponsiveItem(
                        colSizes: 'col-6',
                        child: DetailsCardWidget(
                            title: 'Fase',
                            text: widget.inspecao.tpFase != null ?
                            Fase.fromCod(widget.inspecao.tpFase!).desc : null
                        )
                    ),
                  ]
              )
            ],
          ),
        )
      ],
    );
  }
}
