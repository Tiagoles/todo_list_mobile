import 'package:flutter/material.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class BodyCard extends StatelessWidget {

  final IconData? icon;
  final Widget? title;
  final Widget _child;
  final bool expanded;
  final bool hasDivider;

  const BodyCard({
    super.key,
    this.icon,
    this.title,
    required Widget child,
    this.expanded = true,
    this.hasDivider = false,
  }) : _child = child;

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return Card(
      elevation: 8,
      color: colors.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.primary.withAlpha(50)),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if(title != null) ...[
              Row(
                spacing: 8,
                children: [
                  if(icon != null) Icon(icon, color: colors.primary, size: textTheme.titleLarge!.fontSize),
                  Expanded(child: title!)
                ]
              ),
              Divider(color: colors.secondary.withAlpha(50)),
            ],
            child
          ],
        ),
      ),
    );
  }

  Widget get child{
    if(expanded) return Expanded(child: _child);
    return _child;
  }

}
