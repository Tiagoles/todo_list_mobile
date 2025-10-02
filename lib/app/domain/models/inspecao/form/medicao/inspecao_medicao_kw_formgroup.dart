import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:smaservicos/app/domain/validators/inspecao/inspecao_validator.dart';

class InspecaoMedicaoKwFormGroup extends FormGroup<Map<String, dynamic>> {

  final InspecaoValidator validators;

  InspecaoMedicaoKwFormGroup(this.validators) : super({
    'vlConstLeitKwPonta':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlConstLeitKwPonta']
    ),
    'vlConstLeitKwForaPonta':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlConstLeitKwForaPonta']
    ),
    'vlConstLeitKwGeral':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlConstLeitKwGeral']
    ),
    'vlLeitKwPonta':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLeitKwPonta']
    ),
    'vlLeitKwFPonta':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLeitKwFPonta']
    ),
    'vlLeitKwGeral':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLeitKwGeral']
    ),
  });

  @override
  fromModel(Map<String, dynamic> model) {
    for(var entry in controls.entries) {
      control(entry.key).setValue(model[entry.key] ?? '');
    }
  }

  @override
  Map<String, dynamic> toModel() {
    throw UnimplementedError();
  }

}