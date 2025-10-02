import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smaservicos/app/plugins/modal_actions.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/file_pickers/file_input/file_preview_card.dart';

class FileInputList extends StatelessWidget {
  final List<File> files;
  final Function(int index) onRemove;

  const FileInputList({super.key, required this.files, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final validatedFiles = files.where((file) => file.existsSync()).toList();
    return StaggeredGrid.count(
      crossAxisCount: 12,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: validatedFiles.mapIndexed((i,file) => FilePreviewCard(
        onTap: () {
          ModalActions.showGaleryModal(context,
              images: validatedFiles, initialIndex: i);
        },
        image: file,
        onDelete: () {
          onRemove(files.indexWhere((f) => f == file));
        },
      )).toList(),
    );
  }

}
