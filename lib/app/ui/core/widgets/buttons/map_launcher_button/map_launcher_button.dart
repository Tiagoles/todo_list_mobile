import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/map_launcher_button/map_launcher_bottom_sheet.dart';

class MapLauncherButton extends StatelessWidget {

  final Coords coords;

  const MapLauncherButton({
    super.key,
    required this.coords
  });

  Future<void> openMapsSheet(BuildContext context) async {
    try {
      const title = 'Coordenadas';
      final availableMaps = await MapLauncher.installedMaps;

      if(!context.mounted) return;
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        builder: (BuildContext context) {
          return MapLauncherBottomSheet(
            availableMaps: availableMaps,
            coords: coords,
            title: title,
          );
        },
      );
    } catch (e) {
      ToastrService.error(context: context, message: 'Erro ao carregar aplicativos de mapas. Tente novamente mais tarde.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BootstrapButtonWidget(
      text: 'Abrir Mapas',
      color: ButtonColor.success,
      size: ButtonSize.small,
      icon: TablerIcons.map_2,
      onPressed: () => openMapsSheet(context),
    );
  }
}