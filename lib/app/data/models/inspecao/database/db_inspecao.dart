import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';

part 'db_inspecao.map.dart';

@Entity()
class DbInspecao with _DbInspecao{
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  int nrInspecao;
  @Property(type: PropertyType.date)
  DateTime dtAberturaInspecao;
  double cdUnConsumidora;
  double nrPdaCarga;
  double cdConsumidor;
  double? cdClasse;
  String? tpFase;
  double? nrMedidorKwh;
  double? nrMedidorKvarh;
  double? vlConstKwhPonta;
  double? vlConstKwhForaPonta;
  double? vlConstKwhGeral;
  double? vlConstKwPonta;
  double? vlConstKwForaPonta;
  double? vlConstKwGeral;
  double? vlConstKvarhPonta;
  double? vlConstKvarhForaPonta;
  double? vlConstKvarhGeral;
  double? vlConstEspecial;
  String? flLacreCxPadrao;
  String? flLacreMedidores;
  String? flRotacaoMedidores;
  @Property(type: PropertyType.date)
  DateTime? dtConclusaoInspecao;
  double? cdInspetor;
  String? idUsuario;
  double? flSituacao;
  String? dsObservacao;
  String? hrAberturaInspecao;
  String? hrConclusaoInspecao;
  String? idUsuarioAbertura;
  String? idUsuarioConclusao;
  @Property(type: PropertyType.date)
  DateTime? dtCancelamento;
  String? idUsuarioCancelamento;
  double? anoReferencia;
  @Property(type: PropertyType.date)
  DateTime? dtInspecao;
  double? vlConstMedidor;
  double? vlLacreCaixa;
  double? flResultado;
  String? flGeraFatura;
  double? vlConstMedidorKvarh;
  double? vlConstMedidorEsp;
  double? vlLacreMedidor5;
  String? dsIrregularidades;
  double? vlLacreCaixa1;
  double? vlLacreReativo;
  double? vlLacreReativo1;
  double? vlLacreTcs;
  double? vlLacreTcs1;
  String? flLacreControlado;
  @Property(type: PropertyType.date)
  DateTime? dtLacreControlado;
  double? flMotivoInspecao;
  String? flMonitoramento;
  double? vlLacreControlado;
  String? flDeficienciaMedicao;
  String? flFaturamentoIncorreto;
  String? vlLacreConfMedAtivo1;
  String? vlLacreConfMedAtivo2;
  String? vlLacreConfMedAtivo3;
  String? vlLacreConfMedAtivo4;
  String? vlLacreConfMedReativo1;
  String? vlLacreConfMedReativo2;
  String? vlLacreConfMedReativo3;
  String? vlLacreConfMedReativo4;
  String? vlLacreMedidor1;
  String? vlLacreMedidor2;
  String? vlLacreMedidor3;
  String? vlLacreMedidor4;
  String? vlLacreMedidorKvarh1;
  String? vlLacreMedidorKvarh2;
  String? vlLacreMedidorKvarh3;
  String? vlLacreMedidorKvarh4;
  String? flPendencias;
  String? dsPendencias;
  String? dsObservacaoMotivo;
  double tpInspecao;
  double? cdEmpresa;
  String dsRua;
  String? dsComplemento;
  String dsBairro;
  String dsMunicipio;
  String cdEstado;
  double longitude;
  double latitude;
  double dsNumero;
  double cdCep;
  double? cdCompCep;
  double cdMunicipio;
  String flCarregadoPda;
  double? nrCgcCpf;
  String? dsPostoTransformador;
  String? dsConsumidor;
  String? nrIe;
  String? dsClasse;
  String? vlTensaoNominal;
  double? vlUltConstKwhPonta;
  double? vlUltLeitKwhPonta;
  double? vlUltConstKwhForaPonta;
  double? vlUltLeitKwhForaPonta;
  double? vlUltConstKwhGeral;
  double? vlUltLeitKwhGeral;
  double? vlUltConstEspecial;
  double? vlUltLeitEspecial;
  double? vlUltConstKvarhPonta;
  double? vlUltLeitKvarhPonta;
  double? vlUltConstKvarhForaPonta;
  double? vlUltLeitKvarhForaPonta;
  double? vlUltConstKvarhGeral;
  double? vlUltLeitKvarhGeral;
  double? vlUltConstKwPonta;
  double? vlUltLeitKwPonta;
  double? vlUltConstKwForaPonta;
  double? vlUltLeitKwForaPonta;
  double? vlUltConstKwGeral;
  double? vlUltLeitKwGeral;
  int? cdTipoOcorrencia;
  String? dsComplementarOcorrencia;
  @Property(type: PropertyType.date)
  DateTime? deletedAt;
  final conclusao = ToOne<DbInspecaoConclusao>();
  int status;

  DbInspecao({
    this.id = 0,
    required this.nrInspecao,
    required this.dtAberturaInspecao,
    required this.cdUnConsumidora,
    required this.nrPdaCarga,
    required this.cdConsumidor,
    this.cdClasse,
    this.tpFase,
    this.nrMedidorKwh,
    this.nrMedidorKvarh,
    this.vlConstKwhPonta,
    this.vlConstKwhForaPonta,
    this.vlConstKwhGeral,
    this.vlConstKwPonta,
    this.vlConstKwForaPonta,
    this.vlConstKwGeral,
    this.vlConstKvarhPonta,
    this.vlConstKvarhForaPonta,
    this.vlConstKvarhGeral,
    this.vlConstEspecial,
    this.flLacreCxPadrao,
    this.flLacreMedidores,
    this.flRotacaoMedidores,
    this.dtConclusaoInspecao,
    this.cdInspetor,
    this.idUsuario,
    this.flSituacao,
    this.dsObservacao,
    this.hrAberturaInspecao,
    this.hrConclusaoInspecao,
    this.idUsuarioAbertura,
    this.idUsuarioConclusao,
    this.dtCancelamento,
    this.idUsuarioCancelamento,
    this.anoReferencia,
    this.dtInspecao,
    this.vlConstMedidor,
    this.vlLacreCaixa,
    this.flResultado,
    this.flGeraFatura,
    this.vlConstMedidorKvarh,
    this.vlConstMedidorEsp,
    this.vlLacreMedidor5,
    this.dsIrregularidades,
    this.vlLacreCaixa1,
    this.vlLacreReativo,
    this.vlLacreReativo1,
    this.vlLacreTcs,
    this.vlLacreTcs1,
    this.flLacreControlado,
    this.dtLacreControlado,
    this.flMotivoInspecao,
    this.flMonitoramento,
    this.vlLacreControlado,
    this.flDeficienciaMedicao,
    this.flFaturamentoIncorreto,
    this.vlLacreConfMedAtivo1,
    this.vlLacreConfMedAtivo2,
    this.vlLacreConfMedAtivo3,
    this.vlLacreConfMedAtivo4,
    this.vlLacreConfMedReativo1,
    this.vlLacreConfMedReativo2,
    this.vlLacreConfMedReativo3,
    this.vlLacreConfMedReativo4,
    this.vlLacreMedidor1,
    this.vlLacreMedidor2,
    this.vlLacreMedidor3,
    this.vlLacreMedidor4,
    this.vlLacreMedidorKvarh1,
    this.vlLacreMedidorKvarh2,
    this.vlLacreMedidorKvarh3,
    this.vlLacreMedidorKvarh4,
    this.flPendencias,
    this.dsPendencias,
    this.dsObservacaoMotivo,
    required this.tpInspecao,
    required this.dsRua,
    this.dsComplemento,
    required this.dsBairro,
    required this.dsMunicipio,
    required this.cdEstado,
    required this.longitude,
    required this.latitude,
    required this.dsNumero,
    required this.cdCep,
    this.cdCompCep,
    required this.cdMunicipio,
    required this.flCarregadoPda,
    this.cdEmpresa,
    this.nrCgcCpf,
    this.dsPostoTransformador,
    this.dsConsumidor,
    this.nrIe,
    this.dsClasse,
    this.vlTensaoNominal,
    this.vlUltConstKwhPonta,
    this.vlUltLeitKwhPonta,
    this.vlUltConstKwhForaPonta,
    this.vlUltLeitKwhForaPonta,
    this.vlUltConstKwhGeral,
    this.vlUltLeitKwhGeral,
    this.vlUltConstEspecial,
    this.vlUltLeitEspecial,
    this.vlUltConstKvarhPonta,
    this.vlUltLeitKvarhPonta,
    this.vlUltConstKvarhForaPonta,
    this.vlUltLeitKvarhForaPonta,
    this.vlUltConstKvarhGeral,
    this.vlUltLeitKvarhGeral,
    this.vlUltConstKwPonta,
    this.vlUltLeitKwPonta,
    this.vlUltConstKwForaPonta,
    this.vlUltLeitKwForaPonta,
    this.vlUltConstKwGeral,
    this.vlUltLeitKwGeral,
    this.cdTipoOcorrencia,
    this.dsComplementarOcorrencia,
    this.status = 0
  });

  factory DbInspecao.fromEntity(Inspecao entity) => _DbInspecao._fromEntity(entity);
  Inspecao toEntity([bool includeRelationship = false]) => super._toEntity(this, includeRelationship);

}