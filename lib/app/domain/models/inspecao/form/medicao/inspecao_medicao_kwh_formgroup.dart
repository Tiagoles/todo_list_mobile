import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:smaservicos/app/domain/validators/inspecao/inspecao_validator.dart';

class InspecaoMedicaoKWhFormGroup extends FormGroup<Map<String, dynamic>> {

  final InspecaoValidator validators;

  InspecaoMedicaoKWhFormGroup(this.validators) : super({
    'vlConstLeitKwhPonta':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlConstLeitKwhPonta']
    ),
    'vlConstLeitKwhForaPonta':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlConstLeitKwhForaPonta']
    ),
    'vlConstLeitKwhGeral':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlConstLeitKwhGeral']
    ),
    'vlConstLeitEspecial':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlConstLeitEspecial']
    ),
    'vlLeitKwhPonta':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLeitKwhPonta']
    ),
    'vlLeitKwhForaPonta':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLeitKwhForaPonta']
    ),
    'vlLeitKwhGeral':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLeitKwhGeral']
    ),
    'vlLeitKwhEspecial':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLeitKwhEspecial']
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
