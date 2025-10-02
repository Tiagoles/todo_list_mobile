import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/themes/colors/app_colors.dart';

class CameraSwapButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;

  const CameraSwapButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  State<CameraSwapButtonWidget> createState() =>
      _CameraSwapButtonWidgetState();
}

class _CameraSwapButtonWidgetState
    extends State<CameraSwapButtonWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 0.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handlePressed() {
    _controller.forward().then((_) {
      _controller.reset();
      widget.onPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedBuilder(animation: _controller, builder: (_, w){
      return IconButton(
        style: IconButton.styleFrom(
            shape: const CircleBorder(side: BorderSide(color: AppColors.light)),
            backgroundColor: AppColors.transparentLight,
            padding: const EdgeInsets.all(8)),
        onPressed: _handlePressed,
        icon: RotationTransition(
          turns: _rotationAnimation,
          child: Icon(
            TablerIcons.refresh,
            size: screenWidth * 0.05,
            color: AppColors.light,
          ),
        ),
      );
    });
  }
}
