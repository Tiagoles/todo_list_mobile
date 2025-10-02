import 'package:flutter/material.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/control_value_acessor.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/labels/label_widget.dart';

class RadioGroupOption<T> {
  final String title;
  final T value;
  final String? subtitle;
  final bool enabled;

  RadioGroupOption({required this.title, required this.value, this.subtitle, this.enabled = true});
}

class RadioGroupWidget<T> extends ControlValueAcessor<T?, T?> {
  final String? label;
  final List<RadioGroupOption<T>> options;

  const RadioGroupWidget({
    super.key,
    required this.options,
    super.enabled,
    super.required,
    this.label,
    super.control,
    super.validator,
    super.formGroup,
    super.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: control,
      builder: (context, _){
        final errorText = validator?.call(value);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(label != null) Label(text: label!),
            RadioGroup<T>(
              groupValue: value,
              child: Column(children: items),
              onChanged: (T? newValue){
                if(!isDisabled){
                  value = newValue;
                }
              },
            ),
            if (errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  errorText,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
          ],
        );
    });
  }

  List<Widget> get items{
    return options.map((e) => Radio<T>(
      value: e.value,
      enabled: e.enabled,
    )).toList();
  }

}
