import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/file_pickers/file_input/viewmodels/file_input_viewmodel.dart';
import 'package:smaservicos/app/ui/core/widgets/shapes/drag_down_shape_widget.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class FileInputActionDialog extends StatelessWidget {

  final FileInputViewModel viewModel;

  const FileInputActionDialog({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 32,
            mainAxisSize: MainAxisSize.min,
            children: [
              const DragDownShapeWidget(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Adicionar imagens',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Escolha a origem dos arquivos.',
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  BootstrapButtonWidget(
                    icon: TablerIcons.camera,
                    size: ButtonSize.block,
                    text: 'Câmera',
                    onPressed: (){
                      Navigator.pop(context);
                      viewModel.pickFromCamera(context);
                    },
                  ),
                  BootstrapButtonWidget(
                    icon: TablerIcons.file,
                    color: ButtonColor.info,
                    size: ButtonSize.block,
                    text: 'Arquivos',
                    onPressed: (){
                      Navigator.pop(context);
                      viewModel.pickFromFiles(context);
                    },
                  ),
                  const SizedBox(height: 16),
                  BootstrapButtonWidget(
                    color: ButtonColor.dark,
                    type: ButtonType.outlinedButton,
                    size: ButtonSize.block,
                    icon: TablerIcons.x,
                    text: 'Cancelar',
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
