import 'package:smaservicos/app/domain/validators/inspecao/inspecao_validator.dart';
import 'package:dart_ng_forms/dart_ng_forms.dart';

class InspecaoLacresRetiradosFormGroup extends FormGroup<Map<String, dynamic>> {

  final InspecaoValidator validators;

  InspecaoLacresRetiradosFormGroup(this.validators) : super({
    'vlLacreRetPadAtivo1': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacreRetPadAtivo1'],
    ),
    'vlLacreRetPadAtivo2': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacreRetPadAtivo2'],
    ),
    'vlLacreRetPadAtivo3': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacreRetPadAtivo3'],
    ),
    'vlLacreRetPadAtivo4': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacreRetPadAtivo4'],
    ),
    'vlLacreRetPadReativo1': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacreRetPadReativo1'],
    ),
    'vlLacreRetPadReativo2': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacreRetPadReativo2'],
    ),
    'vlLacreRetPadReativo3': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacreRetPadReativo3'],
    ),
    'vlLacreRetPadReativo4': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacreRetPadReativo4'],
    ),
    'vlLacreRetTcs1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetTcs1']
    ),
    'vlLacreRetTcs2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetTcs2']
    ),
    'vlLacreRetTcs3': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetTcs3']
    ),
    'vlLacreRetTcs4': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetTcs4']
    ),
    'vlLacreRetCaixaDeriva1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetCaixaDeriva1']
    ),
    'vlLacreRetCaixaDeriva2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetCaixaDeriva2']
    ),
    'vlLacreRetChaveProtec1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetChaveProtec1']
    ),
    'vlLacreRetChaveProtec2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetChaveProtec2']
    ),
    'vlLacreRetBorne1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetBorne1']
    ),
    'vlLacreRetBorne2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetBorne2']
    ),
    'vlLacreRetBorne3': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetBorne3']
    ),
    'vlLacreRetBorne4': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetBorne4']
    ),
    'vlLacreRetChaveAfer1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetChaveAfer1']
    ),
    'vlLacreRetChaveAfer2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetChaveAfer2']
    ),
    'vlLacreRetDemanda': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetDemanda']
    ),
    'vlLacreRetPortaOptica': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetPortaOptica']
    ),
    'vlLacreRetCubiculo1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetCubiculo1']
    ),
    'vlLacreRetCubiculo2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetCubiculo2']
    ),
    'vlLacreRetCxBarram1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetCxBarram1']
    ),
    'vlLacreRetCxBarram2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetCxBarram2']
    ),
    'vlLacreRetCxBarram3': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetCxBarram3']
    ),
    'vlLacreRetCxBarram4': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetCxBarram4']
    ),
    'vlLacreRetDisplay': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreRetDisplay']
    ),
  });

  @override
  Future<Map<String, dynamic>> toModel() {
    throw UnimplementedError();
  }

  @override
  fromModel(Map<String, dynamic> model) {
    for(var entry in controls.entries) {
      textControl(entry.key).setValue(model[entry.key] ?? '');
    }
  }

}
