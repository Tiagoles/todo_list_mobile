import 'dart:io';

import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/data/models/acao_tomada/database/db_acao_tomada_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao/database/anexo/db_inspecao_anexo.dart';
import 'package:smaservicos/app/data/models/inspecao/database/db_inspecao.dart';
import 'package:smaservicos/app/data/models/inspecao_item/database/db_inspecao_item_conclusao.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/database/db_tipo_irregularidade_conclusao.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';

part 'db_inspecao_conclusao.map.dart';

@Entity()
class DbInspecaoConclusao with _DbInspecaoConclusao{
  int id;
  @Property(type: PropertyType.date)
  DateTime dtInicio;
  @Property(type: PropertyType.date)
  DateTime? dtFim;
  String? dsObservacao;
  String? vlTc1;
  String? vlTc2;
  String? vlTp1;
  String? vlTp2;
  String? vlCorrenteMaxima;
  String? vlCorrenteMaximaFim;
  String? vlCorrenteDisjuntor;
  String? vlChaveProtecao;
  String? vlCaboEntrada;
  String? vlLacAdicPadAtivo1;
  String? vlLacAdicPadAtivo2;
  String? vlLacAdicPadAtivo3;
  String? vlLacAdicPadAtivo4;
  String? vlLacAdicPadReativo1;
  String? vlLacAdicPadReativo2;
  String? vlLacAdicPadReativo3;
  String? vlLacAdicPadReativo4;
  String? vlLacreAdicTcs1;
  String? vlLacreAdicTcs2;
  String? vlLacreAdicTcs3;
  String? vlLacreAdicTcs4;
  String? vlLacAdicCxDeriva1;
  String? vlLacAdicCxDeriva2;
  String? vlLacAdicChaveProt1;
  String? vlLacAdicChaveProt2;
  String? vlLacreAdicBorne1;
  String? vlLacreAdicBorne2;
  String? vlLacreAdicBorne3;
  String? vlLacreAdicBorne4;
  String? vlLacreAdicChaveAfer1;
  String? vlLacreAdicChaveAfer2;
  String? vlLacreAdicDemanda;
  String? vlLacreAdicDisplay;
  String? vlLacreAdicPortaOptica;
  String? vlLacreAdicCubiculo1;
  String? vlLacreAdicCubiculo2;
  String? vlLacreAdicCxBarram1;
  String? vlLacreAdicCxBarram2;
  String? vlLacreAdicCxBarram3;
  String? vlLacreAdicCxBarram4;
  String? vlLacreRetPadAtivo1;
  String? vlLacreRetPadAtivo2;
  String? vlLacreRetPadAtivo3;
  String? vlLacreRetPadAtivo4;
  String? vlLacreRetPadReativo1;
  String? vlLacreRetPadReativo2;
  String? vlLacreRetPadReativo3;
  String? vlLacreRetPadReativo4;
  String? vlLacreRetTcs1;
  String? vlLacreRetTcs2;
  String? vlLacreRetTcs3;
  String? vlLacreRetTcs4;
  String? vlLacreRetCaixaDeriva1;
  String? vlLacreRetCaixaDeriva2;
  String? vlLacreRetChaveProtec1;
  String? vlLacreRetChaveProtec2;
  String? vlLacreRetBorne1;
  String? vlLacreRetBorne2;
  String? vlLacreRetBorne3;
  String? vlLacreRetBorne4;
  String? vlLacreRetChaveAfer1;
  String? vlLacreRetChaveAfer2;
  String? vlLacreRetDemanda;
  String? vlLacreRetDisplay;
  String? vlLacreRetPortaOptica;
  String? vlLacreRetCubiculo1;
  String? vlLacreRetCubiculo2;
  String? vlLacreRetCxBarram1;
  String? vlLacreRetCxBarram2;
  String? vlLacreRetCxBarram3;
  String? vlLacreRetCxBarram4;
  String? vlLeitKwhPonta;
  String? vlLeitKwhForaPonta;
  String? vlLeitKwhGeral;
  String? vlLeitKwhEspecial;
  String? vlLeitKwPonta;
  String? vlLeitKwFPonta;
  String? vlLeitKwGeral;
  String? vlLeitKvarhPonta;
  String? vlLeitKvarhFPonta;
  String? vlLeitKvarhGeral;
  String? vlConstLeitKwhPonta;
  String? vlConstLeitKwhForaPonta;
  String? vlConstLeitKwhGeral;
  String? vlConstLeitKwPonta;
  String? vlConstLeitKwForaPonta;
  String? vlConstLeitKwGeral;
  String? vlConstLeitKvarhPonta;
  String? vlConsLeitKvarhForPonta;
  String? vlConstLeitKvarhGeral;
  String? vlConstLeitEspecial;
  final inspecao = ToOne<DbInspecao>();
  @Backlink('inspecao')
  final itensInspecionados = ToMany<DbInspecaoItemConclusao>();
  @Backlink('inspecao')
  final irregularidades = ToMany<DbTipoIrregularidadeConclusao>();
  @Backlink('inspecao')
  final acoesTomadas = ToMany<DbAcaoTomadaConclusao>();
  @Backlink('inspecao')
  final anexos = ToMany<DbInspecaoAnexo>();

  DbInspecaoConclusao({
    this.id = 0,
    required this.dtInicio,
    this.dtFim,
    this.dsObservacao,
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
  });

  factory DbInspecaoConclusao.fromEntity(InspecaoConclusao entity) => _DbInspecaoConclusao._fromEntity(entity);
  InspecaoConclusao toEntity() => super._toEntity(this);

}