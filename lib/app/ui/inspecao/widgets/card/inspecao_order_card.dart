import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/order_card/order_card.dart';

class InspecaoOrderCard extends StatelessWidget {

  final Inspecao inspecao;
  final bool isSyncing;
  final String? error;
  final VoidCallback onTap;
  final SyncStatus syncStatus;

  const InspecaoOrderCard({
    super.key,
    required this.inspecao,
    required this.isSyncing,
    required this.onTap,
    required this.syncStatus,
    this.error
  });

  @override
  Widget build(BuildContext context) {
    return OrderCard(
      isSyncing: isSyncing,
      error: error,
      onTap: onTap,
      syncStatus: syncStatus,
      address: inspecao.address,
      autor: inspecao.idUsuarioAbertura,
      dateOpened: inspecao.dtAberturaInspecao,
      details: {
        'Cód. UC' : inspecao.cdUnConsumidora.toInt().toString(),
        'Obs' : inspecao.dsObservacaoMotivo,
      },
    );
  }
}
