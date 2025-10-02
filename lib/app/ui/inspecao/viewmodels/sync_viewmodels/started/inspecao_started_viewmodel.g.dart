// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspecao_started_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InspecaoStartedViewModel on InspecaoStartedViewModelBase, Store {
  late final _$modelsAtom = Atom(
    name: 'InspecaoStartedViewModelBase.models',
    context: context,
  );

  @override
  ObservableList<SyncViewModel<Inspecao>> get models {
    _$modelsAtom.reportRead();
    return super.models;
  }

  @override
  set models(ObservableList<SyncViewModel<Inspecao>> value) {
    _$modelsAtom.reportWrite(value, super.models, () {
      super.models = value;
    });
  }

  @override
  String toString() {
    return '''
models: ${models}
    ''';
  }
}
