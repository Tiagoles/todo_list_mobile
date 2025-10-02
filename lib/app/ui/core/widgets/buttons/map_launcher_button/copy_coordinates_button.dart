import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/plugins/overlay_service.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';

class CopyCoordinatesButton extends StatelessWidget {
  final double latitude;
  final double longitude;

  const CopyCoordinatesButton({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  void _copyCoordinates(BuildContext context) {
    final String coordinates = 'latitude: $latitude, longitude: $longitude';

    Clipboard.setData(ClipboardData(text: coordinates));

    OverlayService.showOverlay(context: context, message: 'Coordenadas copiadas!');
  }

  @override
  Widget build(BuildContext context) {
    return BootstrapButtonWidget(
      type: ButtonType.outlinedButton,
      color: ButtonColor.defaultColor,
      size: ButtonSize.block,
      text: 'Copiar Coordenadas',
      onPressed: () => _copyCoordinates(context),
      icon: TablerIcons.copy,
    );
  }
}