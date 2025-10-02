import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:smaservicos/app/domain/validators/inspecao/inspecao_validator.dart';

class InspecaoLacresAdicionadosFormGroup extends FormGroup<Map<String, dynamic>> {

  final InspecaoValidator validators;

  InspecaoLacresAdicionadosFormGroup(this.validators) : super({
    'vlLacAdicPadAtivo1': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacAdicPadAtivo1'],
    ),
    'vlLacAdicPadAtivo2': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacAdicPadAtivo2'],
    ),
    'vlLacAdicPadAtivo3': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacAdicPadAtivo3'],
    ),
    'vlLacAdicPadAtivo4': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacAdicPadAtivo4'],
    ),
    'vlLacAdicPadReativo1': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacAdicPadReativo1'],
    ),
    'vlLacAdicPadReativo2': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacAdicPadReativo2'],
    ),
    'vlLacAdicPadReativo3': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacAdicPadReativo3'],
    ),
    'vlLacAdicPadReativo4': FormControl.text(
      initialValue: '',
      validator: validators.rules['vlLacAdicPadReativo4'],
    ),
    'vlLacreAdicTcs1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicTcs1']
    ),
    'vlLacreAdicTcs2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicTcs2']
    ),
    'vlLacreAdicTcs3': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicTcs3']
    ),
    'vlLacreAdicTcs4': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicTcs4']
    ),
    'vlLacAdicCxDeriva1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacAdicCxDeriva1']
    ),
    'vlLacAdicCxDeriva2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacAdicCxDeriva2']
    ),
    'vlLacAdicChaveProt1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacAdicChaveProt1']
    ),
    'vlLacAdicChaveProt2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacAdicChaveProt2']
    ),
    'vlLacreAdicBorne1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicBorne1']
    ),
    'vlLacreAdicBorne2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicBorne2']
    ),
    'vlLacreAdicBorne3': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicBorne3']
    ),
    'vlLacreAdicBorne4': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicBorne4']
    ),
    'vlLacreAdicChaveAfer1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicChaveAfer1']
    ),
    'vlLacreAdicChaveAfer2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicChaveAfer2']
    ),
    'vlLacreAdicDemanda': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicDemanda']
    ),
    'vlLacreAdicPortaOptica': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicPortaOptica']
    ),
    'vlLacreAdicCubiculo1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicCubiculo1']
    ),
    'vlLacreAdicCubiculo2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicCubiculo2']
    ),
    'vlLacreAdicCxBarram1': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicCxBarram1']
    ),
    'vlLacreAdicCxBarram2': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicCxBarram2']
    ),
    'vlLacreAdicCxBarram3': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicCxBarram3']
    ),
    'vlLacreAdicCxBarram4': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicCxBarram4']
    ),
    'vlLacreAdicDisplay': FormControl.text(
        initialValue: '',
        validator: validators.rules['vlLacreAdicDisplay']
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

  bool hasAnyValue() {
    for(var entry in controls.entries) {
      if(textControl(entry.key).value.toString().isNotEmpty) {
        return true;
      }
    }
    return false;
  }

}
