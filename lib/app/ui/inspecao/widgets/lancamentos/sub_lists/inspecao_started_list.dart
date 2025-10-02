import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/started/inspecao_started_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/card/inspecao_order_card.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class InspecaoStartedList extends StatefulWidget {

  final InspecaoStartedViewModel viewmodel;

  const InspecaoStartedList({
    super.key,
    required this.viewmodel,
  });

  @override
  State<InspecaoStartedList> createState() =>
      _InspecaoStartedListState();
}

class _InspecaoStartedListState extends State<InspecaoStartedList> {

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
          child: Center(child: Text('Iniciadas'.toUpperCase(), style: textTheme.bodyLarge!.apply(color: colors.primary))),
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
                    onTap: (){
                      Modular.to.pushNamed('/inspecao/${entity.model.id}');
                    },
                    inspecao: entity.model,
                    syncStatus: SyncStatus.started,
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
