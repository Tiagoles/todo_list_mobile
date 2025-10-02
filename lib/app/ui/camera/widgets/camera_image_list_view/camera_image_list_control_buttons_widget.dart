import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/camera/widgets/camera_image_list_view/camera_list_confirm_button_widget.dart';
import 'package:smaservicos/app/ui/themes/colors/app_colors.dart';

class CameraImageListControlButtonsWidget extends StatefulWidget {
  final VoidCallback onConfirm;
  final VoidCallback onClear;
  final List<File> images;

  const CameraImageListControlButtonsWidget({
    super.key,
    required this.images,
    required this.onConfirm,
    required this.onClear,
  });

  @override
  State<CameraImageListControlButtonsWidget> createState() =>
      _CameraImageListControlButtonsWidgetState();
}

class _CameraImageListControlButtonsWidgetState
    extends State<CameraImageListControlButtonsWidget>
    with TickerProviderStateMixin {
  late AnimationController _cancelController;
  late AnimationController _confirmController;
  late Animation<Offset> _cancelOffsetAnimation;
  late Animation<double> _cancelOpacityAnimation;
  late Animation<Offset> _confirmOffsetAnimation;
  late Animation<double> _confirmOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _cancelController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _confirmController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _cancelOffsetAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _cancelController,
        curve: Curves.easeInOut,
      ),
    );

    _confirmOffsetAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _confirmController,
        curve: Curves.easeInOut,
      ),
    );

    _cancelOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_cancelController);

    _confirmOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_confirmController);

    _cancelController.forward();
    _confirmController.forward();
  }

  @override
  void dispose() {
    _cancelController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Column(
        children: [
          SlideTransition(
            position: _cancelOffsetAnimation,
            child: FadeTransition(
              opacity: _cancelOpacityAnimation,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.dark.withValues(alpha: 0.8),
                  padding: const EdgeInsets.all(12),
                ),
                onPressed: () async {
                  await _confirmController.reverse();
                  await _cancelController.reverse();
                  widget.onClear();
                },
                icon: const Icon(
                  TablerIcons.x,
                  size: 16,
                  color: AppColors.light,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          SlideTransition(
            position: _confirmOffsetAnimation,
            child: FadeTransition(
              opacity: _confirmOpacityAnimation,
              child: CameraListConfirmButtonWidget(
                onConfirm: () async {
                  await _confirmController.reverse();
                  await _cancelController.reverse();
                  widget.onConfirm();
                },
                text: widget.images.length.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
