import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_entity.freezed.dart';
part 'config_entity.g.dart';

@freezed
sealed class Configs with _$Configs {
  const factory Configs({
    int? numeroPda,
    @Default(10) int timer,
  }) = _Configs;

  factory Configs.fromJson(Map<String, dynamic> json) => _$ConfigsFromJson(json);
}
