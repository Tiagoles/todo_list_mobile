import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/flex_row.dart';
import 'package:smaservicos/app/ui/core/widgets/grid/grid_responsive_item.dart';
import 'package:smaservicos/app/ui/core/widgets/layouts/form_layout/form_layout.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/placeholder/detail_card_placeholder.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class InspecaoFormPlaceholder extends StatelessWidget {
  const InspecaoFormPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FormLayout(
      title: '',
      body: Shimmer.fromColors(
        period: const Duration(seconds: 2),
        baseColor: colors.primary.withValues(alpha: 0.3),
        highlightColor: colors.primary.withValues(alpha: 0.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.black,
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.primaryContainer),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black,
                        height: 160,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: FlexRow(children: [
                          GridResponsiveItem(
                            colSizes: 'col-12',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 24,
                                  color: Colors.black,
                                ),
                                Divider(color: colors.surfaceContainerHigh)
                              ],
                            ),
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-12',
                              child: DetailCardPlaceholder()
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-12',
                              child: DetailCardPlaceholder(lineNumbers: 2)
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-12',
                              child: SizedBox(height: 16)
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-6',
                              child: DetailCardPlaceholder()
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-6',
                              child: DetailCardPlaceholder()
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-12',
                              child: SizedBox(height: 16)
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-6',
                              child: DetailCardPlaceholder()
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-6',
                              child: DetailCardPlaceholder()
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-12',
                              child: DetailCardPlaceholder(lineNumbers: 2)
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-6',
                              child: DetailCardPlaceholder()
                          ),
                          const GridResponsiveItem(
                              colSizes: 'col-6',
                              child: DetailCardPlaceholder()
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      footerItems: [
        Shimmer.fromColors(
          baseColor: colors.primary.withValues(alpha: 0.3),
          highlightColor: colors.primary.withValues(alpha: 0.5),
          child:Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colors.primaryContainer
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        Shimmer.fromColors(
          baseColor: colors.primary.withValues(alpha: 0.3),
          highlightColor: colors.primary.withValues(alpha: 0.5),
          child:Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colors.primaryContainer
            ),
          ),
        )
      ],
    );
  }
}
