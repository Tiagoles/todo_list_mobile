import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';

class MapLauncherApps extends StatelessWidget {

  final List<AvailableMap> availableMaps;
  final Coords coords;
  final String title;

  const MapLauncherApps({
    super.key,
    required this.availableMaps,
    required this.coords,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 32,
          children: availableMaps.map((map) => GestureDetector(
            onTap: () => map.showMarker(
              coords: coords,
              title: title,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(
                      map.icon,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  map.mapName,
                  style: Theme.of(context).textTheme.labelSmall!.apply(color: colors.primary),
                ),
              ],
            ),
          )).toList(),
        ),
      ),
    );
  }
}
