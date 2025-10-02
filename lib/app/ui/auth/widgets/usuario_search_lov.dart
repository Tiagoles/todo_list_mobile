import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/domain/entities/core/lov_entity.dart';
import 'package:smaservicos/app/domain/models/auth/forms/login_form.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/search_inputs/reactive_form_search.dart';
import 'package:smaservicos/app/ui/eletricista/viewmodels/eletricista_lov_viewmodel.dart';

class UsuarioSearchLov extends StatelessWidget {
  final ValueChanged<LovEntity> onSelected;
  final LoginForm formGroup;

  UsuarioSearchLov({
    super.key,
    required this.onSelected,
    required this.formGroup,
  });

  final EletricistaLovViewModel _eletricistaLovViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    return ReactiveFormSearch(
      labelText: 'Eletricista',
      onSearch: _eletricistaLovViewModel.findLov,
      name: 'nome',
      formGroup: formGroup,
      fieldController: formGroup.textControl('nome').controller,
      onSelected: onSelected,
      hintText: 'Nome do Eletricista',
      modalTitle: 'Eletricistas',
    );
  }
}