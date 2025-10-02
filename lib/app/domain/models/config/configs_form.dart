import 'package:smaservicos/app/domain/entities/config/config_entity.dart';
import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:smaservicos/app/utils/constants.dart';

class ConfigsForm extends FormGroup<Configs>{

  ConfigsForm() : super({
    'numeroPda': FormControl.text(
      initialValue: null
    ),
    'timer': FormControl.text(initialValue: Constants.timer.toString())
  });

  @override
  fromModel(Configs model) {
    control('numeroPda').setValue(model.numeroPda?.toString() ?? '');
    control('timer').setValue(model.timer.toString());
  }

  @override
  Configs toModel() {
    return Configs(
      numeroPda: int.tryParse(control('numeroPda').value) ?? 0,
      timer: int.tryParse(control('timer').value) ?? 10
    );
  }

}