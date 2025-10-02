import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/camera/widgets/camera_control_buttons/camera_flash_toggle_button_widget.dart';
import 'package:smaservicos/app/ui/camera/widgets/camera_control_buttons/camera_swap_button_widget.dart';
import 'package:smaservicos/app/ui/camera/widgets/camera_control_buttons/camera_take_picture_button_widget.dart';
import 'package:smaservicos/app/ui/camera/widgets/camera_image_list_view/camera_image_list_view_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/themes/colors/app_colors.dart';

class CameraControlButtonsWidget extends StatelessWidget {
  final Widget cameraPreview;
  final VoidCallback onConfirm;
  final VoidCallback onReturn;
  final VoidCallback onCaptureImage;
  final VoidCallback onToggleFlash;
  final VoidCallback onSwitchCamera;
  final bool isFlashOn;
  final bool isFrontCamera;
  final double cameraAspectRatio;
  final List<File> images;
  final bool loading;

  const CameraControlButtonsWidget({
    super.key,
    required this.cameraPreview,
    required this.onConfirm,
    required this.images,
    required this.onCaptureImage,
    required this.onToggleFlash,
    required this.onSwitchCamera,
    required this.isFlashOn,
    required this.cameraAspectRatio,
    required this.onReturn,
    required this.isFrontCamera,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * cameraAspectRatio,
                child: cameraPreview,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BootstrapButtonWidget(
                    color: ButtonColor.light,
                    paddingHorizontal: 8,
                    paddingVertical: 8,
                    icon: TablerIcons.arrow_left,
                    onPressed: onReturn,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.8),
                    Colors.black.withValues(alpha: 0.6),
                    Colors.black.withValues(alpha: 0.4),
                    Colors.black.withValues(alpha: 0.2),
                    AppColors.transparentDark,
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CameraImageListViewWidget(
                    onConfirm: onConfirm,
                    images: images,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 32,
                    children: [
                      CameraFlashToggleButtonWidget(
                        isChecked: isFlashOn,
                        onPressed: onToggleFlash,
                      ),
                      CameraTakePictureButtonWidget(onPressed: onCaptureImage, loading: loading),
                      CameraSwapButtonWidget(onPressed: onSwitchCamera),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

}


