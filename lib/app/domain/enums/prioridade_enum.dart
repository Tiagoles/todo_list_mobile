import 'package:flutter/material.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

enum PrioridadeEnum {
  muitoBaixa(1, 'Muito baixa'),
  baixa(2, 'Baixa'),
  moderada(3, 'Moderada'),
  alta(4, 'Alta'),
  muitoAlta(5, 'Muito alta');

  final int code;
  final String label;

  const PrioridadeEnum(this.code, this.label);

  Color color(BuildContext context) {
    final colors = context.colors;
    switch (this) {
      case PrioridadeEnum.muitoBaixa:
        return colors.tertiaryContainer;
      case PrioridadeEnum.baixa:
        return colors.tertiary;
      case PrioridadeEnum.moderada:
        return Colors.orange;
      case PrioridadeEnum.alta:
        return Colors.deepOrange;
      case PrioridadeEnum.muitoAlta:
        return colors.error;
    }
  }
}
