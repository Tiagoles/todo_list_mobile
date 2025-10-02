import 'dart:io';

import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:smaservicos/app/domain/validators/inspecao/inspecao_validator.dart';

class InspecaoObservacoesFormGroup extends FormGroup<Map<String, dynamic>> {

  final InspecaoValidator validators;

  InspecaoObservacoesFormGroup(this.validators) : super({
    'dsObservacao': FormControl.text(
      initialValue: '',
      validator: validators.rules['dsObservacao'],
    ),
    'anexos': FormControl.create<List<File>>(initialValue: [], validator: validators.rules['anexos']),
  });

  @override
  Future<Map<String, dynamic>> toModel() {
    throw UnimplementedError();
  }

  @override
  fromModel(Map<String, dynamic> model) {
    textControl('dsObservacao').setValue(model['dsObservacao'] ?? '');
    control('anexos').setValue(model['anexos'] ?? <File>[]);
  }

}
