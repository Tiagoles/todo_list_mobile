// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apontamento_hora_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApontamentoHoraViewModel on ApontamentoHoraViewModelBase, Store {
  Computed<Map<DateTime, List<ApontamentoCompleto>>>? _$perDayComputed;

  @override
  Map<DateTime, List<ApontamentoCompleto>> get perDay =>
      (_$perDayComputed ??= Computed<Map<DateTime, List<ApontamentoCompleto>>>(
        () => super.perDay,
        name: 'ApontamentoHoraViewModelBase.perDay',
      )).value;
  Computed<Map<int, Map<DateTime, List<ApontamentoCompleto>>>>? _$perWeekComputed;

  @override
  Map<int, Map<DateTime, List<ApontamentoCompleto>>> get perWeek =>
      (_$perWeekComputed ??=
              Computed<Map<int, Map<DateTime, List<ApontamentoCompleto>>>>(
                () => super.perWeek,
                name: 'ApontamentoHoraViewModelBase.perWeek',
              ))
          .value;

  late final _$apontamentosAtom = Atom(
    name: 'ApontamentoHoraViewModelBase.apontamentos',
    context: context,
  );

  @override
  ObservableList<ApontamentoCompleto> get apontamentos {
    _$apontamentosAtom.reportRead();
    return super.apontamentos;
  }

  @override
  set apontamentos(ObservableList<ApontamentoCompleto> value) {
    _$apontamentosAtom.reportWrite(value, super.apontamentos, () {
      super.apontamentos = value;
    });
  }

  @override
  String toString() {
    return '''
apontamentos: ${apontamentos},
perDay: ${perDay},
perWeek: ${perWeek}
    ''';
  }
}
