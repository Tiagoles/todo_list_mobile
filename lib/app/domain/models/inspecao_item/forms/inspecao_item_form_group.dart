import 'package:smaservicos/app/data/models/inspecao_item/conclusao/inspecao_item_conclusao.dart';
import 'package:smaservicos/app/domain/entities/inspecao_item/inspecao_item.dart';
import 'package:dart_ng_forms/dart_ng_forms.dart';

class InspecaoItemFormGroup extends FormGroup<List<InspecaoItemConclusao>>{

  final List<InspecaoItem> items;

  InspecaoItemFormGroup([this.items = const []]) : super({}){
    for(var item in items) {
      register(item.cdItemInspecionado.toInt().toString(), FormControl.create<int?>(initialValue: null));
    }
  }

  @override
  fromModel(items) {
    for(var item in items) {
      final controlName = item.cdItemInspecionado.toString();
      if(contains(controlName)) {
        control<int?,int?>(controlName).setValue(item.flProcedenteImprocedente);
      }
    }
  }

  @override
  toModel() {
    return items.map((item) {
      final cd = item.cdItemInspecionado.toInt();
      final controlValue = control<int?, int?>(cd.toString()).value;
      if(controlValue == null) return null;
      return InspecaoItemConclusao(cd, controlValue);
    }).whereType<InspecaoItemConclusao>().toList();
  }

  @override
  Map<String, dynamic> getRawValue() {
    return {
      'itensInspecionados': items
        .where((item) => control<int?,int?>(item.cdItemInspecionado.toInt().toString()).value != null)
        .map((item) {
          return {
            'cdItemInspecionado': item.cdItemInspecionado,
            'flProcedenteImprocedente': control(item.cdItemInspecionado.toInt().toString()).value,
          };
        }).toList(),
    };
  }

}