import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/completing/inspecao_completing_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/card/inspecao_order_card.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class InspecaoCompletingList extends StatefulWidget {

  final InspecaoCompletingViewModel viewmodel;

  const InspecaoCompletingList({
    super.key,
    required this.viewmodel,
  });

  @override
  State<InspecaoCompletingList> createState() =>
      _InspecaoCompletingListState();
}

class _InspecaoCompletingListState extends State<InspecaoCompletingList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    if (widget.viewmodel.models.isEmpty) return const SliverToBoxAdapter();

    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(child: Text('Efetivando'.toUpperCase(), style: textTheme.bodyLarge!.apply(color: colors.primary))),
        ),
        Observer(builder: (_) {
          final models = widget.viewmodel.models;
          return Column(
            spacing: 8,
            children: models.map((entity) {
                return ListenableBuilder(
                  listenable: entity,
                  builder: (context, _){
                    return InspecaoOrderCard(
                      isSyncing: entity.isLoading,
                      error: entity.error,
                      onTap: (){},
                      inspecao: entity.model,
                      syncStatus: SyncStatus.completing,
                    );
                  },
                );
              }).toList()
          );
        })
      ]),
    );
  }
}
