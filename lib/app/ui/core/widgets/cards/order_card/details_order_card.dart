import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/datails_card/details_card_widget.dart';

class DetailsOrderCard extends StatelessWidget {

  final Map<String, String?> data;
  final VoidCallback onStartPressed;
  final SyncStatus syncStatus;

  const DetailsOrderCard({
    super.key,
    this.data = const {},
    required this.onStartPressed,
    required this.syncStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...data.entries.map((entry) =>
              DetailsCardWidget(
                  title: entry.key,
                  text: entry.value == null || entry.value!.trim().isEmpty ? 'N/A' : entry.value
              )
          ),
          button
        ],
      ),
    );
  }

  Widget get button{
    if(SyncStatus.fromRemote == syncStatus){
      return BootstrapButtonWidget(
        onPressed: onStartPressed,
        text: 'Iniciar Inspeção',
        size: ButtonSize.block,
        icon: TablerIcons.check,
      );
    }
    if(SyncStatus.started == syncStatus){
      return BootstrapButtonWidget(
        onPressed: onStartPressed,
        text: 'Continuar Inspeção',
        size: ButtonSize.block,
        icon: TablerIcons.check,
      );
    }
    return Container();
  }

}