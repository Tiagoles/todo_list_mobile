import 'package:collection/collection.dart';
import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/text_inputs/dynamic_form_field_placeholder.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class DynamicFormField extends StatefulWidget {
  
  final FormGroup formGroup;
  final List<String> fieldNames;
  final String label;

  const DynamicFormField({
    super.key,
    required this.formGroup,
    required this.fieldNames,
    required this.label,
  });

  @override
  State<DynamicFormField> createState() => _DynamicFormFieldState();
}

class _DynamicFormFieldState extends State<DynamicFormField> {

  final displayed = ValueNotifier<List<String>>([]);

  @override
  void initState() {
    widget.fieldNames.mapIndexed((index, name) {
      if ((widget.formGroup.contains(name) && widget.formGroup.textControl(name).value.isNotEmpty) || index == 0) {
        displayed.value.add(name);
      }
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: widget.label),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: context.colors.surfaceContainerHigh,
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: displayed,
            builder: (snapshot, context, _){
              return Column(
                children: [
                  ...fields,
                  if(displayed.value.length < widget.fieldNames.length)
                    DynamicFormFieldPlaceholder(
                      icon: getIcon(displayed.value.length),
                      onTap: (){
                        final nextField = widget.fieldNames.firstWhereOrNull(
                              (name) => !displayed.value.contains(name),
                        );
                        if (nextField != null) {
                          displayed.value = [...displayed.value, nextField];
                        }
                      },
                    )
                ],
              );
            },
          ),
        )
      ],
    );
  }

  List<Widget> get fields{
    return widget.fieldNames
      .where((name) => widget.formGroup.contains(name)
        && displayed.value.contains(name)
      )
      .mapIndexed((index,name){
        return StyledFormField(
          type: TextInputType.number,
          formGroup: widget.formGroup,
          name: name,
          prefixIcon: getIcon(index),
        );
      }).toList();
  }

  IconData getIcon(int index){
    return [
      TablerIcons.square_number_1,
      TablerIcons.square_number_2,
      TablerIcons.square_number_3,
      TablerIcons.square_number_4,
    ][index];
  }
}
