import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/medicao/inspecao_medicao_kw_formgroup.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/flex_row.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/grid_responsive_item.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/extensions/double_extension.dart';

class MedidorKwForm extends StatelessWidget {

  final Inspecao inspecao;
  final InspecaoMedicaoKwFormGroup formGroup;

  const MedidorKwForm({super.key, required this.formGroup, required this.inspecao});

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
                        'Última: ${inspecao.vlUltConstKwPonta?.format(3) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlConstLeitKwPonta',
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
                        'Última: ${inspecao.vlUltLeitKwPonta?.format(0) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlLeitKwPonta',
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
                        'Última: ${inspecao.vlUltConstKwForaPonta?.format(3) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlConstLeitKwForaPonta',
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
                        'Última: ${inspecao.vlUltLeitKwForaPonta?.format(0) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlLeitKwFPonta',
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
                        'Última: ${inspecao.vlUltConstKwGeral?.format(3) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlConstLeitKwGeral',
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
                        'Última: ${inspecao.vlUltLeitKwGeral?.format(0) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlLeitKwGeral',
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
