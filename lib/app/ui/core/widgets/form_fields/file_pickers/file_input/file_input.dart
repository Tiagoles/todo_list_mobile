import 'dart:io';
import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/file_pickers/file_input/file_input_list.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/file_pickers/file_input/viewmodels/file_input_viewmodel.dart';

class FileInput extends StatelessWidget {
  final FormControl<List<File>, List<File>> control;
  final Function(int index)? onRemove;
  final FileInputViewModel viewModel;

  FileInput({
    super.key,
    required this.control,
    this.onRemove,
  }) : viewModel = FileInputViewModel(files: control.valueNotifier, onRemove: onRemove);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => control.isDisabled ? null : viewModel.showCustomActionSheet(context),
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              color: colors.surfaceContainerHigh,
              dashPattern: [8, 4],
              radius: const Radius.circular(4),
            ),
            child: Builder(
              builder: (_) => Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: !control.isDisabled ? colors.surfaceContainerLowest : colors.surface,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(TablerIcons.upload, size: 24, color: colors.primary),
                    const SizedBox(width: 16),
                    Text(
                      'Selecionar',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.apply(color: colors.primary),
                    ),
                    Text(
                      ' Imagens',
                      overflow: TextOverflow.clip,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: colors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder<List<File>>(
            valueListenable: control.valueNotifier,
            builder: (context, value, _) => FileInputList(
                onRemove: viewModel.removeFile,
                files: value
            )
        ),
      ],
    );
  }
}