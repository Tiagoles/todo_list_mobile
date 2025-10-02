import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/cupertino.dart';
import 'package:smaservicos/app/data/models/acao_tomada/api/conclusao/acao_tomada_conclusao.dart';
import 'package:smaservicos/app/domain/entities/acao_tomada/acao_tomada.dart';

class AcaoTomadaFormGroup extends FormGroup<List<AcaoTomadaConclusao>>{

  final List<AcaoTomada> items;

  AcaoTomadaFormGroup([this.items = const []]) : super({}){
    for(var item in items) {
      final controlName = item.cdAcaoTomada.toInt().toString();
      registerAll({
        controlName: FormControl.create<bool>(initialValue: false),
        '${controlName}_obs': FormControl.text(initialValue: null),
        '${controlName}_ft': FormControl.create<bool>(initialValue: false),
      });
    }
  }

  @override
  fromModel(items) {
    for(var item in items) {
      final controlName = item.cdAcaoTomada.toString();
      if(contains(controlName)) {
        control<bool,bool>(controlName).setValue(true);
        textControl('${controlName}_obs').setValue(item.dsObservacao ?? '');
        control<bool,bool>('${controlName}_ft').setValue(item.dtEfetivacao != null);
      }
    }
  }

  @override
  toModel() {
    return items.map((item) {
      final controlName = item.cdAcaoTomada.toInt().toString();
      final checked = control<bool, bool>(controlName).value;
      if(checked) return null;
      final obs = control<TextEditingValue, String>('${controlName}_obs').value;
      final dtEfetivacao = control<bool, bool>('${controlName}_ft').value ? DateTime.now() : null;
      return AcaoTomadaConclusao(
        cdAcaoTomada: item.cdAcaoTomada.toInt(),
        dsObservacao: obs,
        dtEfetivacao: dtEfetivacao
      );
    }).whereType<AcaoTomadaConclusao>().toList();
  }

  @override
  Map<String, dynamic> getRawValue() {
    return {
      'acoesTomadas': items
        .where((item) => control<bool, bool>(item.cdAcaoTomada.toInt().toString()).value)
        .map((item) {
          return {
            'cdAcaoTomada': item.cdAcaoTomada.toInt(),
            if(control<bool, bool>('${item.cdAcaoTomada.toInt()}_ft').value) 'dtEfetivacao': DateTime.now().toIso8601String(),
            'dsObservacao': control('${item.cdAcaoTomada.toInt()}_obs').value,
          };
        }).toList(),
    };
  }

}