import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/entities/inspecao_item/inspecao_item.dart';

part 'inspecao_item_api_result.g.dart';

@JsonSerializable(createToJson: false)
class InspecaoItemApiResult {
  final int cdItemInspecionado;
  final String dsItemInspecionado;

  InspecaoItemApiResult({
    required this.cdItemInspecionado,
    required this.dsItemInspecionado,
  });

  factory InspecaoItemApiResult.fromJson(Map<String, dynamic> json) =>
      _$InspecaoItemApiResultFromJson(json);

  InspecaoItem toEntity() {
    return InspecaoItem(
      cdItemInspecionado: cdItemInspecionado,
      dsItemInspecionado: dsItemInspecionado,
    );
  }

}