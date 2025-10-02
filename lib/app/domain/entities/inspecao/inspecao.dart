import 'package:brasil_fields/brasil_fields.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';
import 'package:smaservicos/app/utils/extensions/util_brasil_fields_extension.dart';

part 'inspecao.freezed.dart';
part 'inspecao.g.dart';

@freezed
abstract class Inspecao with _$Inspecao {
  const factory Inspecao({
    int? id,//Quando vem do BD local
    required double nrInspecao,
    required DateTime dtAberturaInspecao,
    required double cdUnConsumidora,
    required double nrPdaCarga,
    required double cdConsumidor,
    double? cdClasse,
    String? tpFase,
    double? nrMedidorKwh,
    double? nrMedidorKvarh,
    double? vlConstKwhPonta,
    double? vlConstKwhForaPonta,
    double? vlConstKwhGeral,
    double? vlConstKwPonta,
    double? vlConstKwForaPonta,
    double? vlConstKwGeral,
    double? vlConstKvarhPonta,
    double? vlConstKvarhForaPonta,
    double? vlConstKvarhGeral,
    double? vlConstEspecial,
    String? flLacreCxPadrao,
    String? flLacreMedidores,
    String? flRotacaoMedidores,
    DateTime? dtConclusaoInspecao,
    double? cdInspetor,
    String? idUsuario,
    double? flSituacao,
    String? dsObservacao,
    String? hrAberturaInspecao,
    String? hrConclusaoInspecao,
    String? idUsuarioAbertura,
    String? idUsuarioConclusao,
    DateTime? dtCancelamento,
    String? idUsuarioCancelamento,
    double? anoReferencia,
    DateTime? dtInspecao,
    double? vlConstMedidor,
    double? vlLacreCaixa,
    double? flResultado,
    String? flGeraFatura,
    double? vlConstMedidorKvarh,
    double? vlConstMedidorEsp,
    double? vlLacreMedidor5,
    String? dsIrregularidades,
    double? vlLacreCaixa1,
    double? vlLacreReativo,
    double? vlLacreReativo1,
    double? vlLacreTcs,
    double? vlLacreTcs1,
    String? flLacreControlado,
    DateTime? dtLacreControlado,
    double? flMotivoInspecao,
    String? flMonitoramento,
    double? vlLacreControlado,
    String? flDeficienciaMedicao,
    String? flFaturamentoIncorreto,
    String? vlLacreConfMedAtivo1,
    String? vlLacreConfMedAtivo2,
    String? vlLacreConfMedAtivo3,
    String? vlLacreConfMedAtivo4,
    String? vlLacreConfMedReativo1,
    String? vlLacreConfMedReativo2,
    String? vlLacreConfMedReativo3,
    String? vlLacreConfMedReativo4,
    String? vlLacreMedidor1,
    String? vlLacreMedidor2,
    String? vlLacreMedidor3,
    String? vlLacreMedidor4,
    String? vlLacreMedidorKvarh1,
    String? vlLacreMedidorKvarh2,
    String? vlLacreMedidorKvarh3,
    String? vlLacreMedidorKvarh4,
    String? flPendencias,
    String? dsPendencias,
    String? dsObservacaoMotivo,
    required double tpInspecao,
    double? cdEmpresa,
    required String dsRua,
    String? dsComplemento,
    required String dsBairro,
    required String dsMunicipio,
    required String cdEstado,
    required double longitude,
    required double latitude,
    required double dsNumero,
    required double cdCep,
    double? cdCompCep,
    required double cdMunicipio,
    required String flCarregadoPda,
    double? nrCgcCpf,
    String? dsPostoTransformador,
    String? dsConsumidor,
    String? nrIe,
    String? dsClasse,
    String? vlTensaoNominal,
    double? vlUltConstKwhPonta,
    double? vlUltLeitKwhPonta,
    double? vlUltConstKwhForaPonta,
    double? vlUltLeitKwhForaPonta,
    double? vlUltConstKwhGeral,
    double? vlUltLeitKwhGeral,
    double? vlUltConstEspecial,
    double? vlUltLeitEspecial,
    double? vlUltConstKvarhPonta,
    double? vlUltLeitKvarhPonta,
    double? vlUltConstKvarhForaPonta,
    double? vlUltLeitKvarhForaPonta,
    double? vlUltConstKvarhGeral,
    double? vlUltLeitKvarhGeral,
    double? vlUltConstKwPonta,
    double? vlUltLeitKwPonta,
    double? vlUltConstKwForaPonta,
    double? vlUltLeitKwForaPonta,
    double? vlUltConstKwGeral,
    double? vlUltLeitKwGeral,
    InspecaoConclusao? conclusao,
    int? cdTipoOcorrencia,
    String? dsComplementarOcorrencia,
    @Default(0) int status,
  }) = _Inspecao;

  const Inspecao._();

  String get formattedDoc{
    if(nrCgcCpf == null) return 'N/A';
    if(nrCgcCpf!.toInt() == 0) return 'N/A';
    return UtilBrasilFields()
        .obterCpfCnpj(nrCgcCpf?.toInt().toString())
        .getOrDefault('N/A');
  }
  String get formattedCompCep => cdCompCep != null ? cdCompCep!.toInt().toString() : '';
  String get formattedNumero => dsNumero > 0 ? dsNumero.toInt().toString() : 'N/A';
  String get formattedComplemento => dsComplemento ?? '';
  String get formattedMunicipio => dsMunicipio.toString();
  String get formattedRua => dsRua;
  String get formattedBairro => dsBairro;
  String get formattedEstado => cdEstado.toString();
  String get formattedCep =>
      UtilBrasilFields.obterCep(cdCep.toInt().toString(), ponto: true);
  String get address =>
      '$formattedRua, $formattedNumero - $formattedBairro, $formattedMunicipio - $formattedEstado, $formattedCep-$formattedCompCep';

  factory Inspecao.fromJson(Map<String, dynamic> json) =>
      _$InspecaoFromJson(json);
}
