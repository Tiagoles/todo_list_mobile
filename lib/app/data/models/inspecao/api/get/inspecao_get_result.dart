import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';

part 'inspecao_get_result.g.dart';
part 'inspecao_get_result.map.dart';

@JsonSerializable(includeIfNull: false, createToJson: false)
class InspecaoGetResult with _InspecaoGetResult {
  final double nrInspecao;
  DateTime dtAberturaInspecao;
  final double cdUnConsumidora;
  final double nrPdaCarga;
  final double cdConsumidor;
  final double? cdClasse;
  final String? tpFase;
  final double? nrMedidorKwh;
  final double? nrMedidorKvarh;
  final double? vlConstKwhPonta;
  final String? flLacreCxPadrao;
  final String flCarregadoPda;
  final String? flLacreMedidores;
  final String? flRotacaoMedidores;
  final double? cdInspetor;
  final String? idUsuario;
  final double? flSituacao;
  final String? hrAberturaInspecao;
  final String? idUsuarioAbertura;
  final double? anoReferencia;
  final DateTime? dtInspecao;
  final double? vlConstMedidor;
  final double? flResultado;
  final String? flGeraFatura;
  final double? vlConstMedidorKvarh;
  final double? vlConstMedidorEsp;
  final double? vlLacreMedidor5;
  final String? dsIrregularidades;
  final String? flLacreControlado;
  final DateTime? dtLacreControlado;
  final double? flMotivoInspecao;
  final String? flMonitoramento;
  final double? vlLacreControlado;
  final String? dsMotivoCancelamento;
  final String? vlLacreConfMedAtivo1;
  final String? vlLacreConfMedAtivo2;
  final String? vlLacreConfMedAtivo3;
  final String? vlLacreConfMedAtivo4;
  final String? vlLacreConfMedReativo1;
  final String? vlLacreConfMedReativo2;
  final String? vlLacreConfMedReativo3;
  final String? vlLacreConfMedReativo4;
  final String? flPendencias;
  final String? dsPendencias;
  final String? dsObservacaoMotivo;
  final double tpInspecao;
  final double? cdEmpresa;
  final String dsRua;
  final String? dsComplemento;
  final String dsBairro;
  final String dsMunicipio;
  final String cdEstado;
  final double longitude;
  final double latitude;
  final double dsNumero;
  final double cdCep;
  final double? cdCompCep;
  final double cdMunicipio;
  final double? nrCgcCpf;
  final String? dsPostoTransformador;
  final String? dsConsumidor;
  final String? nrIe;
  final String? dsClasse;
  final String? vlTensaoNominal;
  final String? vlLacreMedidor1;
  final String? vlLacreMedidor2;
  final String? vlLacreMedidor3;
  final String? vlLacreMedidor4;
  final String? vlLacreMedidorKvarh1;
  final String? vlLacreMedidorKvarh2;
  final String? vlLacreMedidorKvarh3;
  final String? vlLacreMedidorKvarh4;
  final double? vlUltConstKwhPonta;
  final double? vlUltLeitKwhPonta;
  final double? vlUltConstKwhForaPonta;
  final double? vlUltLeitKwhForaPonta;
  final double? vlUltConstKwhGeral;
  final double? vlUltLeitKwhGeral;
  final double? vlUltConstEspecial;
  final double? vlUltLeitEspecial;
  final double? vlUltConstKvarhPonta;
  final double? vlUltLeitKvarhPonta;
  final double? vlUltConstKvarhForaPonta;
  final double? vlUltLeitKvarhForaPonta;
  final double? vlUltConstKvarhGeral;
  final double? vlUltLeitKvarhGeral;
  final double? vlUltConstKwPonta;
  final double? vlUltLeitKwPonta;
  final double? vlUltConstKwForaPonta;
  final double? vlUltLeitKwForaPonta;
  final double? vlUltConstKwGeral;
  final double? vlUltLeitKwGeral;
  final int status = SyncStatus.fromRemote.code;


  InspecaoGetResult(this.nrInspecao, this.dtAberturaInspecao,
      this.cdUnConsumidora, this.nrPdaCarga, this.cdConsumidor, this.cdClasse,
      this.tpFase, this.nrMedidorKwh, this.nrMedidorKvarh, this.vlConstKwhPonta,
      this.flLacreCxPadrao, this.flCarregadoPda, this.flLacreMedidores,
      this.flRotacaoMedidores, this.cdInspetor, this.idUsuario, this.flSituacao,
      this.hrAberturaInspecao, this.idUsuarioAbertura, this.anoReferencia,
      this.dtInspecao, this.vlConstMedidor, this.flResultado, this.flGeraFatura,
      this.vlConstMedidorKvarh, this.vlConstMedidorEsp, this.vlLacreMedidor5,
      this.dsIrregularidades, this.flLacreControlado, this.dtLacreControlado,
      this.flMotivoInspecao, this.flMonitoramento, this.vlLacreControlado,
      this.dsMotivoCancelamento, this.vlLacreConfMedAtivo1,
      this.vlLacreConfMedAtivo2, this.vlLacreConfMedAtivo3,
      this.vlLacreConfMedAtivo4, this.vlLacreConfMedReativo1,
      this.vlLacreConfMedReativo2, this.vlLacreConfMedReativo3,
      this.vlLacreConfMedReativo4, this.flPendencias, this.dsPendencias,
      this.dsObservacaoMotivo, this.tpInspecao, this.cdEmpresa, this.dsRua,
      this.dsComplemento, this.dsBairro, this.dsMunicipio, this.cdEstado,
      this.longitude, this.latitude, this.dsNumero, this.cdCep, this.cdCompCep,
      this.cdMunicipio, this.nrCgcCpf, this.dsPostoTransformador,
      this.dsConsumidor, this.nrIe, this.dsClasse, this.vlTensaoNominal,
      this.vlLacreMedidor1, this.vlLacreMedidor2, this.vlLacreMedidor3,
      this.vlLacreMedidor4, this.vlLacreMedidorKvarh1,
      this.vlLacreMedidorKvarh2, this.vlLacreMedidorKvarh3,
      this.vlLacreMedidorKvarh4, this.vlUltConstKwhPonta,
      this.vlUltLeitKwhPonta, this.vlUltConstKwhForaPonta,
      this.vlUltLeitKwhForaPonta, this.vlUltConstKwhGeral,
      this.vlUltLeitKwhGeral, this.vlUltConstEspecial, this.vlUltLeitEspecial,
      this.vlUltConstKvarhPonta, this.vlUltLeitKvarhPonta,
      this.vlUltConstKvarhForaPonta, this.vlUltLeitKvarhForaPonta,
      this.vlUltConstKvarhGeral, this.vlUltLeitKvarhGeral,
      this.vlUltConstKwPonta, this.vlUltLeitKwPonta, this.vlUltConstKwForaPonta,
      this.vlUltLeitKwForaPonta, this.vlUltConstKwGeral, this.vlUltLeitKwGeral);

  factory InspecaoGetResult.fromJson(Map<String, dynamic> json) =>
      _$InspecaoGetResultFromJson(json);

  Inspecao toEntity() => _toEntity(this);

}
