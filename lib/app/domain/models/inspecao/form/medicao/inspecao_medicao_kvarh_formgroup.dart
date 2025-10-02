import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:smaservicos/app/domain/validators/inspecao/inspecao_validator.dart';

class InspecaoMedicaoKVArhFormGroup extends FormGroup<Map<String, dynamic>> {

  final InspecaoValidator validators;

  InspecaoMedicaoKVArhFormGroup(this.validators) : super({
    'vlConstLeitKvarhPonta':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlConstLeitKvarhPonta']
    ),
    'vlConsLeitKvarhForPonta':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlConsLeitKvarhForPonta']
    ),
    'vlConstLeitKvarhGeral':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlConstLeitKvarhGeral']
    ),
    'vlLeitKvarhPonta':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLeitKvarhPonta']
    ),
    'vlLeitKvarhFPonta':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLeitKvarhFPonta']
    ),
    'vlLeitKvarhGeral':  FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLeitKvarhGeral']
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