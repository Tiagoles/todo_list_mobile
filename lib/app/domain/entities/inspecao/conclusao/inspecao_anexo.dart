import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/entities/anexo/anexo.dart';

part 'inspecao_anexo.g.dart';

@JsonSerializable(createToJson: false)
class InspecaoAnexo{

  final int? id;
  final Anexo anexo;
  final int idConclusao;

  InspecaoAnexo({
    this.id,
    required this.anexo,
    required this.idConclusao,
  });

  factory InspecaoAnexo.fromJson(Map<String, dynamic> json) => _$InspecaoAnexoFromJson(json);

}