import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/file_pickers/file_input/file_input_action_dialog.dart';

class FileInputViewModel{

  final ValueNotifier<List<File>> files;
  final Function (int index)? onRemove;

  FileInputViewModel({required this.files, this.onRemove});

  Future<void> showCustomActionSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      barrierLabel: 'Fechar',
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      builder: (context) => FileInputActionDialog(viewModel: this),
    );
  }

  Future<void> pickFromFiles(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
        withData: false,
      );

      if (result == null || result.files.isEmpty) return;

      final picked = result.files
          .where((f) => f.path != null && f.path!.isNotEmpty)
          .map((f) => File(f.path!))
          .toList();

      if (picked.isEmpty) return;

      files.value = [...files.value, ...picked];
    } catch (e) {
      if(context.mounted){
        ToastrService.error(
          context: context,
          message:
          'Ops... Não foi possível selecionar suas imagens agora. Tente novamente.',
          hasIcon: false,
        );
      }
    }
  }

  Future<void> pickFromCamera(BuildContext context) async {
    try {
      final result = await Modular.to.pushNamed<List<File>>('/camera/');
      if (result != null && result.isNotEmpty) {
        files.value = [...files.value, ...result];
      }
    } catch (e) {
      if(context.mounted){
        ToastrService.error(
          context: context,
          message:
          'Ops... Não foi possível abrir a câmera agora. Tente novamente.',
          hasIcon: false,
        );
      }
    }
  }

  void removeFile(int index){
    if(onRemove != null){
      onRemove!(index);
      return;
    }
    files.value = List<File>.from(files.value)..removeAt(index);
  }

}