import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smaservicos/app/utils/extensions/color_scheme_extension.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class OrderCardContent extends StatelessWidget {

  final String address;
  final String autor;
  final DateTime dateOpened;

  const OrderCardContent({
    super.key,
    required this.dateOpened,
    required this.address,
    required this.autor
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            gradient: context.colors.gradientPrimaryLight,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          padding: const EdgeInsets.only(
              top: 26,
              left: 16,
              right: 16,
              bottom: 16
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Aberto em: ${DateFormat('dd/MM/yyyy').format(dateOpened)}',
                  style: textTheme.bodySmall!.apply(color: colors.tertiaryContainer)
              ),
              const SizedBox(height: 8.0),
              Text(
                address,
                style: textTheme.titleSmall!.apply(color: colors.onPrimaryContainer),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Aberto por: $autor',
                style: textTheme.bodySmall!.apply(color: colors.onPrimaryContainer),
              ),
              const SizedBox(height: 8.0)
            ],
          ),
        ),
      ),
    );
  }
}
