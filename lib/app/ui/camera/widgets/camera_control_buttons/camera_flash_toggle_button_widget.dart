import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/toggle_circle_icon_button/toggle_circle_icon_button_widget.dart';
import 'package:smaservicos/app/ui/themes/colors/app_colors.dart';

class CameraFlashToggleButtonWidget extends StatelessWidget {

  final bool isChecked;
  final VoidCallback onPressed;

  const CameraFlashToggleButtonWidget({
    super.key,
    required this.onPressed,
    required this.isChecked
  });

  @override
  Widget build(BuildContext context) {
    return ToggleCircleIconButtonWidget(
      onPressed: onPressed,
      textColor: AppColors.light,
      icon: TablerIcons.bolt_filled,
      checkedBackgroundColor: AppColors.light,
      checkedTextColor: AppColors.dark,
      backgroundColor: AppColors.transparentLight,
      isChecked: isChecked,
    );
  }
}
