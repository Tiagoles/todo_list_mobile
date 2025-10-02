import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/config/viewmodels/configs_form/configs_form_viewmodel.dart';
import 'package:smaservicos/app/ui/config/widgets/config_card.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';

class ConfigFormWidget extends StatelessWidget {
  final ConfigsFormViewModel viewModel;
  final VoidCallback? onExportDatabase;
  final VoidCallback? onImportDatabase;
  final GlobalKey<FormState> formKey;

  const ConfigFormWidget({
    super.key,
    required this.viewModel,
    required this.onExportDatabase,
    required this.onImportDatabase,
    required this.formKey
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
            spacing: 16,
            children: [
              ConfigCard(child: StyledFormField(
                prefixIcon: TablerIcons.number_123,
                formGroup: viewModel.configsForm,
                name: 'numeroPda',
                required: true,
                labelText: 'N° PDA',
                type: TextInputType.number,
                hintText: 'Número PDA',
              )),
              ConfigCard(child: StyledFormField(
                  formGroup: viewModel.configsForm,
                  name: 'timer',
                  prefixIcon: TablerIcons.clock,
                  required: true,
                  labelText: 'Tempo de espera nos modais',
                  type: TextInputType.number,
                  hintText: 'Tempo de espera nos modais.',
                )),
              ConfigCard(child: Column(
                spacing: 8,
                children: [
                  BootstrapButtonWidget(
                    color: ButtonColor.warning,
                    size: ButtonSize.block,
                    text: 'Exportar banco de dados',
                    icon: TablerIcons.database_export,
                    onPressed: onExportDatabase,
                  ),
                  BootstrapButtonWidget(
                    size: ButtonSize.block,
                    color: ButtonColor.primary,
                    text: 'Importar banco de dados',
                    icon: TablerIcons.database_import,
                    onPressed: onImportDatabase,
                  ),
                ],
              ))
            ],
          )
      ),
    );
  }
}
