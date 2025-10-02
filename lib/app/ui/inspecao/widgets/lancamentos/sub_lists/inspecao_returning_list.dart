import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/returning/inspecao_returning_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/card/inspecao_order_card.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class InspecaoReturningList extends StatefulWidget {

  final InspecaoReturningViewModel viewmodel;

  const InspecaoReturningList({
    super.key,
    required this.viewmodel,
  });

  @override
  State<InspecaoReturningList> createState() =>
      _InspecaoReturningListState();
}

class _InspecaoReturningListState extends State<InspecaoReturningList> {

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
          child: Center(child: Text('Retornando'.toUpperCase(), style: textTheme.bodyLarge!.apply(color: colors.primary))),
        ),
        Observer(builder: (_) {
          final models = widget.viewmodel.models;
          return Column(
            spacing: 8,
            children: models.map((entity) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListenableBuilder(
                    listenable: entity,
                    builder: (context, _){
                      return InspecaoOrderCard(
                        isSyncing: entity.isLoading,
                        error: entity.error,
                        onTap: (){},
                        inspecao: entity.model,
                        syncStatus: SyncStatus.returning,
                      );
                    },
                  )
              );
            }).toList()
          );
        })
      ]),
    );
  }
}
