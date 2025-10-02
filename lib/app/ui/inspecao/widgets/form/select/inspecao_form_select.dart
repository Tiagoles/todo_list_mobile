import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/selects/select.dart';
import 'package:smaservicos/app/utils/extensions/color_scheme_extension.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class InspecaoFormSelect extends Select<int> {
  const InspecaoFormSelect({
    super.key,
    required super.options,
    super.label = '',
    required super.control,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: context.colors.gradientPrimaryLight,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              final current = value ?? 0;
              value = (current - 1 + options.length) % options.length;
            },
            icon: Icon(TablerIcons.chevron_left, size: 16, color: context.colors.onPrimaryContainer),
          ),
          Expanded(
            child: ValueListenableBuilder<int?>(
              valueListenable: control.valueNotifier,
              builder: (context, value, _) {
                return DropdownButtonFormField<int>(
                  isExpanded: true,
                  items: items,
                  dropdownColor: context.colors.primaryContainer,
                  onChanged: (val) {
                    if (val != null) {
                      this.value = val;
                      onChanged?.call(val);
                    }
                  },
                  initialValue: value,
                  validator: validator,
                  icon: const SizedBox(),
                  decoration: const InputDecoration(
                    errorMaxLines: 3,
                    filled: false,
                    contentPadding: EdgeInsets.all(8),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  style: context.textTheme.bodyLarge!.apply(
                    color: context.colors.onPrimaryContainer,
                    overflow: TextOverflow.visible,
                  ),
                );
              },
            ),
          ),
          IconButton(
            onPressed: () {
              final current = value ?? 0;
              value = (current + 1) % options.length;
            },
            icon: Icon(TablerIcons.chevron_right, size: 16, color: context.colors.onPrimaryContainer),
          ),
        ],
      ),
    );
  }

  @override
  List<DropdownMenuItem<int>> get items => options.map((opt){
    return DropdownMenuItem<int>(
        value: opt.value,
        child: Center(child: Text(opt.label))
    );
  }).toList();

}
