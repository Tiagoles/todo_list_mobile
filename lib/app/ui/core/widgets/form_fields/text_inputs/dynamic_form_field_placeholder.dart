import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class DynamicFormFieldPlaceholder extends StatefulWidget {

  final VoidCallback onTap;
  final IconData icon;

  const DynamicFormFieldPlaceholder({super.key, required this.onTap, required this.icon});

  @override
  State<DynamicFormFieldPlaceholder> createState() => _DynamicFormFieldPlaceholderState();
}

class _DynamicFormFieldPlaceholderState extends State<DynamicFormFieldPlaceholder> {

  final control = FormControl.text(initialValue: null, options: FormControlOptions(
    isDisabled: true
  ));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(TablerIcons.plus, color: colors.primary.withAlpha(100)),
          StyledFormField(
            enabled: false,
            prefixIcon: widget.icon,
            control: control,
          )
        ],
      ),
    );
  }
}
