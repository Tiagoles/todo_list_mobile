import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/map_launcher_button/copy_coordinates_button.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/map_launcher_button/map_launcher_apps.dart';
import 'package:smaservicos/app/ui/core/widgets/shapes/drag_down_shape_widget.dart';

class MapLauncherBottomSheet extends StatelessWidget {

  final List<AvailableMap> availableMaps;
  final Coords coords;
  final String title;

  const MapLauncherBottomSheet({
    super.key,
    required this.availableMaps,
    required this.coords,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      top: false,
      child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 32,
        mainAxisSize: MainAxisSize.min,
        children: [
          const DragDownShapeWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colors.primary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          TablerIcons.map_2,
                          color: colors.primary,
                          size: 16,
                        ),
                      ),
                      Text(
                        'Abrir com',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                  MapLauncherApps(availableMaps: availableMaps, coords: coords, title: title),
                  const SizedBox(height: 32),
                  CopyCoordinatesButton(latitude: coords.latitude, longitude: coords.longitude)
                ],
              ),
            ),
          )
        ],
      ),
    )
    );
  }
}
