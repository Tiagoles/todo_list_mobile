import 'package:freezed_annotation/freezed_annotation.dart';

part 'inspecao_item_conclusao.g.dart';

@JsonSerializable()
class InspecaoItemConclusao {
  final int cdItemInspecionado;
  final int flProcedenteImprocedente;

  InspecaoItemConclusao(this.cdItemInspecionado, this.flProcedenteImprocedente);

  factory InspecaoItemConclusao.fromJson(Map<String, dynamic> json) =>
      _$InspecaoItemConclusaoFromJson(json);

  Map<String, dynamic> toJson() => _$InspecaoItemConclusaoToJson(this);

}