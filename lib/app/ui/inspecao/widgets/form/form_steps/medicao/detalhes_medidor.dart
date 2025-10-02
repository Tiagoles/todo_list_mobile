import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/datails_card/details_card_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/flex_row.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/grid_responsive_item.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class DetalhesMedidor extends StatelessWidget {

  final Inspecao inspecao;

  const DetalhesMedidor({super.key, required this.inspecao});

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return FlexRow(
      children: [
        GridResponsiveItem(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: colors.surfaceContainerHigh, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Medidor KWh: ${inspecao.nrMedidorKwh?.toInt().toString() ?? 'N/A'}', style: textTheme.titleMedium),
                FlexRow(children: [
                  if(inspecao.vlLacreMedidor1 != null)
                    GridResponsiveItem(
                        colSizes: 'col-6',
                        child: DetailsCardWidget(
                          title: '1° Lacre',
                          text: inspecao.vlLacreMedidor1,
                        )
                    ),
                  if(inspecao.vlLacreMedidor2 != null)
                    GridResponsiveItem(
                        colSizes: 'col-6',
                        child: DetailsCardWidget(
                          title: '2° Lacre',
                          text: inspecao.vlLacreMedidor2,
                        )
                    ),
                  if(inspecao.vlLacreMedidor3 != null)
                    GridResponsiveItem(
                        colSizes: 'col-6 col-xl-4',
                        child: DetailsCardWidget(
                          title: '3° Lacre',
                          text: inspecao.vlLacreMedidor3,
                        )
                    ),
                  if(inspecao.vlLacreMedidor4 != null)
                    GridResponsiveItem(
                        colSizes: 'col-6 col-xl-4',
                        child: DetailsCardWidget(
                          title: '4° Lacre',
                          text: inspecao.vlLacreMedidor4,
                        )
                    ),
                  if(inspecao.vlLacreMedidor5 != null)
                    GridResponsiveItem(
                        colSizes: 'col-6 col-xl-4',
                        child: DetailsCardWidget(
                          title: '5° Lacre',
                          text: inspecao.vlLacreMedidor5?.toInt().toString(),
                        )
                    )
                ])
              ],
            ),
          ),
        ),
        GridResponsiveItem(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: colors.surfaceContainerHigh, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Medidor KVArh: ${inspecao.nrMedidorKvarh?.toInt().toString() ?? 'N/A'}', style: textTheme.titleMedium),
                FlexRow(children: [
                  if(inspecao.vlLacreMedidorKvarh1 != null)
                    GridResponsiveItem(
                        colSizes: 'col-6 col-xl-4',
                        child: DetailsCardWidget(
                          title: '1° Lacre',
                          text: inspecao.vlLacreMedidorKvarh1,
                        )
                    ),
                  if(inspecao.vlLacreMedidorKvarh2 != null)
                    GridResponsiveItem(
                        colSizes: 'col-6 col-xl-4',
                        child: DetailsCardWidget(
                          title: '2° Lacre',
                          text: inspecao.vlLacreMedidorKvarh2,
                        )
                    ),
                  if(inspecao.vlLacreMedidorKvarh3 != null)
                    GridResponsiveItem(
                        colSizes: 'col-6 col-xl-4',
                        child: DetailsCardWidget(
                          title: '3° Lacre',
                          text: inspecao.vlLacreMedidorKvarh3,
                        )
                    ),
                  if(inspecao.vlLacreMedidorKvarh4 != null)
                    GridResponsiveItem(
                        colSizes: 'col-6 col-xl-4',
                        child: DetailsCardWidget(
                          title: '4° Lacre',
                          text: inspecao.vlLacreMedidorKvarh4,
                        )
                    )
                ])
              ],
            ),
          ),
        ),
        GridResponsiveItem(
          colSizes: 'col-12',
          child: DetailsCardWidget(
            title: 'Tensão Nominal:',
            text: inspecao.vlTensaoNominal,
          ),
        ),
      ],
    );
  }
}
