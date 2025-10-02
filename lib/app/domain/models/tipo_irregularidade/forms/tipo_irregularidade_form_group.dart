import 'package:smaservicos/app/data/models/tipo_irregularidade/api/conclusao/tipo_irregularidade_conclusao.dart';
import 'package:smaservicos/app/domain/entities/tipo_irregularidade/tipo_irregularidade.dart';
import 'package:dart_ng_forms/dart_ng_forms.dart';

class TipoIrregularidadeFormGroup extends FormGroup<List<TipoIrregularidadeConclusao>>{

  final List<TipoIrregularidade> items;

  TipoIrregularidadeFormGroup([this.items = const []]) : super({}){
    for(var item in items) {
      final controlName = item.cdTipoIrregularidade.toInt().toString();
      register(controlName, FormControl.create<bool>(initialValue: false));
      register('${controlName}_obs', FormControl.text(initialValue: null));
    }
  }

  @override
  fromModel(items) {
    for(var item in items) {
      final controlName = item.cdTipoIrregularidade.toString();
      if(contains(controlName)) {
        control<bool,bool>(controlName).setValue(true);
        textControl('${controlName}_obs').setValue(item.dsObservacao ?? '');
      }
    }
  }

  @override
  toModel() {
    return items.map((item) {
      final controlName = item.cdTipoIrregularidade.toInt().toString();
      final checked = control<bool,bool>(controlName).value;
      if(checked) return null;
      final obs = control<String,String>('${controlName}_obs').value;
      return TipoIrregularidadeConclusao(item.cdTipoIrregularidade.toInt(),obs);
    }).whereType<TipoIrregularidadeConclusao>().toList();
  }

  @override
  Map<String, dynamic> getRawValue() {
    return {
      'irregularidades': items
        .where((item) => control<bool,bool>(item.cdTipoIrregularidade.toInt().toString()).value)
        .map((item) {
          return {
            'cdTipoIrregularidade': item.cdTipoIrregularidade.toInt(),
            'dsObservacao': control('${item.cdTipoIrregularidade.toInt()}_obs').value,
          };
        }).toList(),
    };
  }

}