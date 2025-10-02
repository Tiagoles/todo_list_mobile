import 'dart:async';
import 'dart:isolate';
import 'package:smaservicos/app/domain/entities/acao_tomada/acao_tomada.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';
import 'package:smaservicos/app/domain/entities/inspecao_item/inspecao_item.dart';
import 'package:smaservicos/app/domain/entities/tipo_irregularidade/tipo_irregularidade.dart';
import 'package:smaservicos/app/domain/models/acao_tomada/forms/acao_tomada_form_group.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/inspecao_complementar_formgroup.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/medicao/inspecao_medicao_formgroup.dart';
import 'package:smaservicos/app/domain/models/inspecao_item/forms/inspecao_item_form_group.dart';
import 'package:smaservicos/app/domain/models/tipo_irregularidade/forms/tipo_irregularidade_form_group.dart';
import 'package:smaservicos/app/domain/validators/inspecao/inspecao_validator.dart';
import 'inspecao_lacres_retirados_formgroup.dart';
import 'inspecao_lacres_adicionados_formgroup.dart';
import 'inspecao_observacoes_formgroup.dart';
import 'package:dart_ng_forms/dart_ng_forms.dart';

class InspecaoFormGroup extends FormGroup<InspecaoConclusao> {

  InspecaoFormGroup({
    required InspecaoValidator validators,
    required InspecaoConclusao initialValue,
    required List<InspecaoItem> items,
    required List<TipoIrregularidade> tipoIrregularidades,
    required List<AcaoTomada> acoesTomadas,
  }) : super({
    'dtInicio': FormControl.create(initialValue: initialValue.dtInicio.toIso8601String()),
    'lacres_retirados': InspecaoLacresRetiradosFormGroup(validators),
    'medicao': InspecaoMedicaoFormGroup(validators),
    'complementar': InspecaoComplementarFormGroup(validators),
    'itens_inspecionados': InspecaoItemFormGroup(items),
    'irregularidades': TipoIrregularidadeFormGroup(tipoIrregularidades),
    'acoesTomadas': AcaoTomadaFormGroup(acoesTomadas),
    'lacres_adicionados': InspecaoLacresAdicionadosFormGroup(validators),
    'observacoes': InspecaoObservacoesFormGroup(validators),
  });

  InspecaoLacresRetiradosFormGroup get lacresRetirados => group<InspecaoLacresRetiradosFormGroup>('lacres_retirados');
  InspecaoMedicaoFormGroup get medicao => group<InspecaoMedicaoFormGroup>('medicao');
  InspecaoComplementarFormGroup get complementar => group<InspecaoComplementarFormGroup>('complementar');
  InspecaoItemFormGroup get itensInspecionados => group<InspecaoItemFormGroup>('itens_inspecionados');
  TipoIrregularidadeFormGroup get irregularidades => group<TipoIrregularidadeFormGroup>('irregularidades');
  AcaoTomadaFormGroup get acoesTomadas => group<AcaoTomadaFormGroup>('acoesTomadas');
  InspecaoLacresAdicionadosFormGroup get lacresAdicionados => group<InspecaoLacresAdicionadosFormGroup>('lacres_adicionados');
  InspecaoObservacoesFormGroup get observacoes => group<InspecaoObservacoesFormGroup>('observacoes');

  @override
  Future<void> fromModel(model) async {
    final map = await Isolate.run(() => model.toJson());
    map['anexos'] = model.anexos;
    lacresRetirados.fromModel(map);
    medicao.fromModel(map);
    complementar.fromModel(map);
    itensInspecionados.fromModel(model.itensInspecionados);
    irregularidades.fromModel(model.irregularidades);
    acoesTomadas.fromModel(model.acoesTomadas);
    lacresAdicionados.fromModel(map);
    observacoes.fromModel(map);
  }

  @override
  Future<InspecaoConclusao> toModel() async {
    final raw = getRawValue();
    final inspecao = await Isolate.run(()=>
        InspecaoConclusao.fromJson(raw));
    return inspecao.copyWith(anexos: raw['anexos'] ?? []);
  }

}