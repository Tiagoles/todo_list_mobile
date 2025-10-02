import 'package:flutter/material.dart';
import 'package:smaservicos/app/ui/themes/colors/app_colors.dart';

class CameraTakePictureButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final bool loading;

  const CameraTakePictureButtonWidget({
    super.key,
    required this.onPressed,
    this.loading = false,
  });

  @override
  State<CameraTakePictureButtonWidget> createState() =>
      _CameraTakePictureButtonWidgetState();
}

class _CameraTakePictureButtonWidgetState
    extends State<CameraTakePictureButtonWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
    );
    _controller.addStatusListener(
      (status) {
        if(status == AnimationStatus.completed) _controller.reverse();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonSize = MediaQuery.of(context).size.width*0.2;
    _sizeAnimation = Tween<double>(
      begin: 8,
      end: 0,
    ).animate(
  CurvedAnimation(parent: _controller, curve: Curves.bounceInOut)
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return GestureDetector(
          onTap: widget.loading ? null : (){
            _controller.forward();
            widget.onPressed();
          },
          child: Container(
            width: buttonSize,
            height: buttonSize,
            padding: EdgeInsets.all(_sizeAnimation.value),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.light),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.light,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        );
      },
    );
  }
}