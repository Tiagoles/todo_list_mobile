import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class FieldWidget extends StatelessWidget {
  final IconData? icon;
  final String label;
  final String? text;
  final DateTime? date;
  final bool isDate;
  final int maxLines;
  final Color? textColor;

  const FieldWidget._({
    Key? key,
    required this.label,
    this.icon,
    this.text,
    this.date,
    required this.isDate,
    this.textColor,
    this.maxLines = 3,
  }) : super(key: key);

  const FieldWidget.date({
    Key? key,
    required String label,
    required DateTime? date,
    IconData? icon = TablerIcons.calendar,
    int maxLines = 1,
  }) : this._(
    key: key,
    label: label,
    date: date,
    icon: icon,
    isDate: true,
    maxLines: maxLines,
  );

  const FieldWidget.text({
    Key? key,
    required String label,
    required String text,
    IconData? icon = TablerIcons.note,
    int maxLines = 3,
    Color? textColor,
  }) : this._(
    key: key,
    label: label,
    text: text,
    icon: icon,
    isDate: false,
    textColor: textColor,
    maxLines: maxLines,
  );

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);

    final displayValue = isDate
        ? (date != null ? DateFormat('dd/MM/yyyy HH:mm:ss').format(date!) : '-')
        : (text ?? '-');

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: colors.inversePrimary.withAlpha(50), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16),
              const SizedBox(width: 8),
            ],
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: textTheme.bodySmall?.copyWith(color: Colors.grey),
                  ),
                  Text(
                    displayValue,
                    style: TextStyle(color: textColor),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
