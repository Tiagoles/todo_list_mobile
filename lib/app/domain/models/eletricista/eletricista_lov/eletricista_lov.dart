import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/mixins/core/lov_mixin.dart';

part 'eletricista_lov.g.dart';

@JsonSerializable(includeIfNull: false, createToJson: false)
class EletricistaLov with LovMixin{
  final double cdEletricista;
  final String dsEletricista;

  EletricistaLov({required this.cdEletricista, required this.dsEletricista});

  factory EletricistaLov.fromJson(Map<String, dynamic> json) => _$EletricistaLovFromJson(json);

  @override
  Map<String, String> get semanticMap => {
    'Eletricista': dsEletricista
  };

  @override
  String get textField => dsEletricista;

}