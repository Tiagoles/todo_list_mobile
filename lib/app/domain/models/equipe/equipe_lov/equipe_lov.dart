import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/mixins/core/lov_mixin.dart';

part 'equipe_lov.g.dart';

@JsonSerializable(includeIfNull: false, createToJson: false)
class EquipeLov with LovMixin{
  final double cdEquipe;
  final String nmEquipe;

  EquipeLov({required this.cdEquipe, required this.nmEquipe});

  factory EquipeLov.fromJson(Map<String, dynamic> json) => _$EquipeLovFromJson(json);

  @override
  Map<String, String> get semanticMap => {
    'Equipe': nmEquipe
  };

  @override
  String get textField => nmEquipe;

}