import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/medicao/inspecao_medicao_kvarh_formgroup.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/flex_row.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/grid_responsive_item.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/extensions/double_extension.dart';

class MedidorKvarhForm extends StatelessWidget {
  final Inspecao inspecao;
  final InspecaoMedicaoKVArhFormGroup formGroup;

  const MedidorKvarhForm({super.key, required this.formGroup, required this.inspecao});

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ponta',
              style: textTheme.titleMedium!.apply(color: colors.primary),
            ),
            Divider(color: colors.surfaceContainerHighest),
            FlexRow(
              children: [
                GridResponsiveItem(
                  colSizes: 'col-6 col-xl-4',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Constante',
                        style: textTheme.labelMedium!.apply(
                          color: colors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Última: ${inspecao.vlUltConstKvarhPonta?.format(3) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlConstLeitKvarhPonta',
                      ),
                    ],
                  ),
                ),
                GridResponsiveItem(
                  colSizes: 'col-6 col-xl-4',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Leitura',
                        style: textTheme.labelMedium!.apply(
                          color: colors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Última: ${inspecao.vlUltLeitKvarhPonta?.format(0) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlLeitKvarhPonta',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fora Ponta',
              style: textTheme.titleMedium!.apply(color: colors.primary),
            ),
            Divider(color: colors.surfaceContainerHighest),
            FlexRow(
              children: [
                GridResponsiveItem(
                  colSizes: 'col-6 col-xl-4',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Constante',
                        style: textTheme.labelMedium!.apply(
                          color: colors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Última: ${inspecao.vlUltConstKvarhForaPonta?.format(3) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlConsLeitKvarhForPonta',
                      ),
                    ],
                  ),
                ),
                GridResponsiveItem(
                  colSizes: 'col-6 col-xl-4',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Leitura',
                        style: textTheme.labelMedium!.apply(
                          color: colors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Última: ${inspecao.vlUltLeitKvarhForaPonta?.format(0) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlLeitKvarhFPonta',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Geral',
              style: textTheme.titleMedium!.apply(color: colors.primary),
            ),
            Divider(color: colors.surfaceContainerHighest),
            FlexRow(
              children: [
                GridResponsiveItem(
                  colSizes: 'col-6 col-xl-4',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Constante',
                        style: textTheme.labelMedium!.apply(
                          color: colors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Última: ${inspecao.vlUltConstKvarhGeral?.format(3) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlConstLeitKvarhGeral',
                      ),
                    ],
                  ),
                ),
                GridResponsiveItem(
                  colSizes: 'col-6 col-xl-4',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Leitura',
                        style: textTheme.labelMedium!.apply(
                          color: colors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Última: ${inspecao.vlUltLeitKvarhGeral?.format(0) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlLeitKvarhGeral',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
