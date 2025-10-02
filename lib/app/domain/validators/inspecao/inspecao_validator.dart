import 'dart:async';
import 'dart:isolate';

import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:smaservicos/app/domain/validators/validator.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/utils/extensions/string_to_decimal.dart';

class InspecaoValidator extends Validator<Inspecao>{

  static FormFieldValidator<Object?> greaterThan0(String field) {
    return (Object? value) {
      final n = value is String ? value.toDecimal() : null;
      if (n == null) return '$field inválido';
      if (n <= 0) return '$field deve ser maior que 0';
      return null;
    };
  }

  @override
  Map<String, FormFieldValidator> get rules => {
    'vlCorrenteMaxima': FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: "Campo 'Corrente Máx. Medidor' obrigatório", checkNullOrEmpty: true),
      greaterThan0('Corrente Máx. Medidor')
    ]),
    'vlCorrenteMaximaFim': FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: "Campo 'Corrente Máx. Medidor' obrigatório", checkNullOrEmpty: true),
      greaterThan0('Corrente Máx. Medidor')
    ]),
    'vlCorrenteDisjuntor' : FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: "Campo 'Corrente Disjuntor' obrigatório", checkNullOrEmpty: true),
      greaterThan0('Corrente Disjuntor')
    ]),
    'vlChaveProtecao': FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: "Campo 'Proteção' obrigatório", checkNullOrEmpty: true),
      greaterThan0('Proteção')
    ]),
    'vlCaboEntrada': FormBuilderValidators.required(errorText: "Campo 'Cond. Eletroduto' obrigatório", checkNullOrEmpty: true),
    'anexos' : FormBuilderValidators.compose([
      FormBuilderValidators.minLength(errorText: 'Anexe ao menos uma foto', 1),
      FormBuilderValidators.maxLength(errorText: 'Adicione no máximo 5 fotos', 5),
    ]),
  };

  @override
  FutureOr<Map<String, dynamic>> toMap(Inspecao inspecao) async {
    return Isolate.run(() => inspecao.toJson());
  }

}