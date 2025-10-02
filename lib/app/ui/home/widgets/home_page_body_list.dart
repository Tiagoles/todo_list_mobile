import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/ui/core/viewmodels/sync_viewmodel.dart';
import 'package:smaservicos/app/ui/core/widgets/empty_widget.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/card/inspecao_order_card.dart';

class HomePageBodyList extends StatelessWidget {

  final void Function(Inspecao) onCardTapped;
  final List<SyncViewModel<Inspecao>> entities;

  const HomePageBodyList({
    super.key,
    required this.onCardTapped,
    required this.entities,
  });

  @override
  Widget build(BuildContext context) {

    if(entities.isEmpty) {
      return const SliverToBoxAdapter(
        child: EmptyWidget(),
      );
    }
    return ListView.builder(
      itemCount: entities.length,
      itemBuilder: (context, index){
        final entity = entities[index];
        return ListenableBuilder(
            listenable: entity,
            builder: (context,_){
              return InspecaoOrderCard(
                isSyncing: entity.isLoading,
                onTap: () => onCardTapped(entity.model),
                error: entity.error,
                inspecao: entity.model,
                syncStatus: SyncStatus.fromRemote,
              );
            }
        );
      },
    );
  }
}
