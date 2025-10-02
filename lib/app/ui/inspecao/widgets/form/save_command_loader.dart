import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/core/widgets/loaders/loading_dots.dart';
import 'package:smaservicos/app/utils/command.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';

class SaveCommandLoader extends StatelessWidget {
  final Command saveCommand;
  const SaveCommandLoader({
    super.key,
    required this.saveCommand,
  });

  @override
  Widget build(BuildContext context) {
    final (colors, customColors) = (context.colors, context.customColors);
    final textStyle = context.textTheme.labelSmall!.apply(color: colors.outline);
    return ListenableBuilder(
      listenable: saveCommand,
      builder: (context, _){
        if(saveCommand.running){
          return Row(
            children: [
              LoadingDots(style: textStyle, speed: 300),
              Text('Salvando', style: textStyle),
            ],
          );
        }
        if(saveCommand.error){
          final errorMessage = saveCommand.result?.exceptionOrNull()?.message;
          if(errorMessage != null){
            return GestureDetector(
              child: Text('! Erro ao salvar', style: textStyle),
              onTap: (){
                ToastrService.error(context: context, message: errorMessage);
              },
            );
          }
        }
        return Row(
          spacing: 4,
          children: [
            Icon(TablerIcons.check, size: 12, color: colors.outline, applyTextScaling: true),
            Text('Salvo', style: textStyle),
          ],
        );
      }
    );
  }
}
