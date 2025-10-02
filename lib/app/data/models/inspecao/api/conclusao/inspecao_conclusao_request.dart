import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/data/models/acao_tomada/api/conclusao/acao_tomada_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao_item/conclusao/inspecao_item_conclusao.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/api/conclusao/tipo_irregularidade_conclusao.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';
import 'package:smaservicos/app/utils/extensions/string_to_decimal.dart';

part 'inspecao_conclusao_request.g.dart';
part 'inspecao_conclusao_request.map.dart';

@JsonSerializable(includeIfNull: true)
class InspecaoConclusaoRequest with _InspecaoConclusaoRequest{

  final double nrInspecao;
  final DateTime dtInicio;
  final DateTime? dtFim;
  final String? dsObservacao;
  final double nrPdaCarga;
  final double? vlTc1;
  final double? vlTc2;
  final double? vlTp1;
  final double? vlTp2;
  final double? vlCorrenteMaxima;
  final double? vlCorrenteMaximaFim;
  final double? vlCorrenteDisjuntor;
  final double? vlChaveProtecao;
  final String? vlCaboEntrada;
  final double? vlLacAdicPadAtivo1;
  final double? vlLacAdicPadAtivo2;
  final double? vlLacAdicPadAtivo3;
  final double? vlLacAdicPadAtivo4;
  final double? vlLacAdicPadReativo1;
  final double? vlLacAdicPadReativo2;
  final double? vlLacAdicPadReativo3;
  final double? vlLacAdicPadReativo4;
  final double? vlLacreAdicTcs1;
  final double? vlLacreAdicTcs2;
  final double? vlLacreAdicTcs3;
  final double? vlLacreAdicTcs4;
  final double? vlLacAdicCxDeriva1;
  final double? vlLacAdicCxDeriva2;
  final double? vlLacAdicChaveProt1;
  final double? vlLacAdicChaveProt2;
  final double? vlLacreAdicBorne1;
  final double? vlLacreAdicBorne2;
  final double? vlLacreAdicBorne3;
  final double? vlLacreAdicBorne4;
  final double? vlLacreAdicChaveAfer1;
  final double? vlLacreAdicChaveAfer2;
  final double? vlLacreAdicDemanda;
  final double? vlLacreAdicDisplay;
  final double? vlLacreAdicPortaOptica;
  final double? vlLacreAdicCubiculo1;
  final double? vlLacreAdicCubiculo2;
  final double? vlLacreAdicCxBarram1;
  final double? vlLacreAdicCxBarram2;
  final double? vlLacreAdicCxBarram3;
  final double? vlLacreAdicCxBarram4;
  final double? vlLacreRetPadAtivo1;
  final double? vlLacreRetPadAtivo2;
  final double? vlLacreRetPadAtivo3;
  final double? vlLacreRetPadAtivo4;
  final double? vlLacreRetPadReativo1;
  final double? vlLacreRetPadReativo2;
  final double? vlLacreRetPadReativo3;
  final double? vlLacreRetPadReativo4;
  final double? vlLacreRetTcs1;
  final double? vlLacreRetTcs2;
  final double? vlLacreRetTcs3;
  final double? vlLacreRetTcs4;
  final double? vlLacreRetCaixaDeriva1;
  final double? vlLacreRetCaixaDeriva2;
  final double? vlLacreRetChaveProtec1;
  final double? vlLacreRetChaveProtec2;
  final double? vlLacreRetBorne1;
  final double? vlLacreRetBorne2;
  final double? vlLacreRetBorne3;
  final double? vlLacreRetBorne4;
  final double? vlLacreRetChaveAfer1;
  final double? vlLacreRetChaveAfer2;
  final double? vlLacreRetDemanda;
  final double? vlLacreRetDisplay;
  final double? vlLacreRetPortaOptica;
  final double? vlLacreRetCubiculo1;
  final double? vlLacreRetCubiculo2;
  final double? vlLacreRetCxBarram1;
  final double? vlLacreRetCxBarram2;
  final double? vlLacreRetCxBarram3;
  final double? vlLacreRetCxBarram4;
  final double? vlLeitKwhPonta;
  final double? vlLeitKwhForaPonta;
  final double? vlLeitKwhGeral;
  final double? vlLeitKwhEspecial;
  final double? vlLeitKwPonta;
  final double? vlLeitKwFPonta;
  final double? vlLeitKwGeral;
  final double? vlLeitKvarhPonta;
  final double? vlLeitKvarhFPonta;
  final double? vlLeitKvarhGeral;
  final double? vlConstLeitKwhPonta;
  final double? vlConstLeitKwhForaPonta;
  final double? vlConstLeitKwhGeral;
  final double? vlConstLeitKwPonta;
  final double? vlConstLeitKwForaPonta;
  final double? vlConstLeitKwGeral;
  final double? vlConstLeitKvarhPonta;
  final double? vlConsLeitKvarhForPonta;
  final double? vlConstLeitKvarhGeral;
  final double? vlConstLeitEspecial;
  final List<InspecaoItemConclusao> itensInspecionados;
  final List<TipoIrregularidadeConclusao> irregularidades;
  final List<AcaoTomadaConclusao> acoesTomadas;

  InspecaoConclusaoRequest({
    required this.nrInspecao,
    required this.dtInicio,
    this.dtFim,
    this.dsObservacao,
    required this.nrPdaCarga,
    this.vlTc1,
    this.vlTc2,
    this.vlTp1,
    this.vlTp2,
    this.vlCorrenteMaxima,
    this.vlCorrenteMaximaFim,
    this.vlCorrenteDisjuntor,
    this.vlChaveProtecao,
    this.vlCaboEntrada,
    this.vlLacAdicPadAtivo1,
    this.vlLacAdicPadAtivo2,
    this.vlLacAdicPadAtivo3,
    this.vlLacAdicPadAtivo4,
    this.vlLacAdicPadReativo1,
    this.vlLacAdicPadReativo2,
    this.vlLacAdicPadReativo3,
    this.vlLacAdicPadReativo4,
    this.vlLacreAdicTcs1,
    this.vlLacreAdicTcs2,
    this.vlLacreAdicTcs3,
    this.vlLacreAdicTcs4,
    this.vlLacAdicCxDeriva1,
    this.vlLacAdicCxDeriva2,
    this.vlLacAdicChaveProt1,
    this.vlLacAdicChaveProt2,
    this.vlLacreAdicBorne1,
    this.vlLacreAdicBorne2,
    this.vlLacreAdicBorne3,
    this.vlLacreAdicBorne4,
    this.vlLacreAdicChaveAfer1,
    this.vlLacreAdicChaveAfer2,
    this.vlLacreAdicDemanda,
    this.vlLacreAdicDisplay,
    this.vlLacreAdicPortaOptica,
    this.vlLacreAdicCubiculo1,
    this.vlLacreAdicCubiculo2,
    this.vlLacreAdicCxBarram1,
    this.vlLacreAdicCxBarram2,
    this.vlLacreAdicCxBarram3,
    this.vlLacreAdicCxBarram4,
    this.vlLacreRetPadAtivo1,
    this.vlLacreRetPadAtivo2,
    this.vlLacreRetPadAtivo3,
    this.vlLacreRetPadAtivo4,
    this.vlLacreRetPadReativo1,
    this.vlLacreRetPadReativo2,
    this.vlLacreRetPadReativo3,
    this.vlLacreRetPadReativo4,
    this.vlLacreRetTcs1,
    this.vlLacreRetTcs2,
    this.vlLacreRetTcs3,
    this.vlLacreRetTcs4,
    this.vlLacreRetCaixaDeriva1,
    this.vlLacreRetCaixaDeriva2,
    this.vlLacreRetChaveProtec1,
    this.vlLacreRetChaveProtec2,
    this.vlLacreRetBorne1,
    this.vlLacreRetBorne2,
    this.vlLacreRetBorne3,
    this.vlLacreRetBorne4,
    this.vlLacreRetChaveAfer1,
    this.vlLacreRetChaveAfer2,
    this.vlLacreRetDemanda,
    this.vlLacreRetDisplay,
    this.vlLacreRetPortaOptica,
    this.vlLacreRetCubiculo1,
    this.vlLacreRetCubiculo2,
    this.vlLacreRetCxBarram1,
    this.vlLacreRetCxBarram2,
    this.vlLacreRetCxBarram3,
    this.vlLacreRetCxBarram4,
    this.vlLeitKwhPonta,
    this.vlLeitKwhForaPonta,
    this.vlLeitKwhGeral,
    this.vlLeitKwhEspecial,
    this.vlLeitKwPonta,
    this.vlLeitKwFPonta,
    this.vlLeitKwGeral,
    this.vlLeitKvarhPonta,
    this.vlLeitKvarhFPonta,
    this.vlLeitKvarhGeral,
    this.vlConstLeitKwhPonta,
    this.vlConstLeitKwhForaPonta,
    this.vlConstLeitKwhGeral,
    this.vlConstLeitKwPonta,
    this.vlConstLeitKwForaPonta,
    this.vlConstLeitKwGeral,
    this.vlConstLeitKvarhPonta,
    this.vlConsLeitKvarhForPonta,
    this.vlConstLeitKvarhGeral,
    this.vlConstLeitEspecial,
    this.itensInspecionados = const [],
    this.irregularidades = const [],
    this.acoesTomadas = const []
});

  factory InspecaoConclusaoRequest.fromJson(Map<String, dynamic> json) => _$InspecaoConclusaoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InspecaoConclusaoRequestToJson(this);

  factory InspecaoConclusaoRequest.fromEntity(InspecaoConclusao entity) => _InspecaoConclusaoRequest._fromEntity(entity);

}