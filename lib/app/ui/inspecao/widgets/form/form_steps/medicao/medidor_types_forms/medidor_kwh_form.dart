import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/medicao/inspecao_medicao_kwh_formgroup.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/flex_row.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/grid_responsive_item.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/extensions/double_extension.dart';

class MedidorKwhForm extends StatelessWidget {

  final Inspecao inspecao;
  final InspecaoMedicaoKWhFormGroup formGroup;

  const MedidorKwhForm({super.key, required this.formGroup, required this.inspecao});

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
                        'Última: ${inspecao.vlUltConstKwhPonta?.format(3) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlConstLeitKwhPonta',
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
                        'Última: ${inspecao.vlUltLeitKwhPonta?.format(0) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlLeitKwhPonta',
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
                        'Última: ${inspecao.vlUltConstKwhForaPonta?.format(3) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlConstLeitKwhForaPonta',
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
                        'Última: ${inspecao.vlUltLeitKwhForaPonta?.format(0) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlLeitKwhForaPonta',
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
                        'Última: ${inspecao.vlUltConstKwhGeral?.format(3) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlConstLeitKwhGeral',
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
                        'Última: ${inspecao.vlUltLeitKwhGeral?.format(0) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlLeitKwhGeral',
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
              'Especial',
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
                        'Última: ${inspecao.vlUltConstEspecial?.format(3) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlConstLeitEspecial',
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
                        'Última: ${inspecao.vlUltLeitEspecial?.format(0) ?? 'N/A'}',
                        style: textTheme.bodyMedium!.apply(
                          color: colors.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StyledFormField(
                        type: TextInputType.number,
                        formGroup: formGroup,
                        name: 'vlLeitKwhEspecial',
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
