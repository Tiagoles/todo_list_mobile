import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/camera/widgets/camera_control_buttons/camera_control_buttons_widget.dart';
import 'package:smaservicos/app/ui/core/load_page.dart';

class CameraPage extends StatefulWidget {

  final CameraController cameraController;
  final List<CameraDescription> availableCameras;

  const CameraPage({
    super.key,
    required this.cameraController,
    required this.availableCameras,
  });

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool isCameraInitialized = false;
  bool isFlashOn = false;
  final List<File> _images = [];
  late CameraController _cameraController;
  late double cameraAspectRatio;
  int _currentCameraIndex = 0;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _cameraController = widget.cameraController;
    _initializeCamera(_cameraController.description);
  }

  Future<void> _initializeCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(cameraDescription, ResolutionPreset.high);
    await _cameraController.initialize();
    setState(() {
      isCameraInitialized = true;
      cameraAspectRatio = _cameraController.value.aspectRatio;
    });
  }

  Future<void> _captureImage() async {
    if (!_cameraController.value.isInitialized) return;
    try {
      setState(() {
        loading = true;
      });
      final XFile file = await _cameraController.takePicture();
      setState(() {
        loading = false;
        _images.add(File(file.path));
      });
    } catch (e) {
      if(!mounted) return;
      ToastrService.error(context: context, message: 'Não foi possível capturar a foto. Entre em contato com o suporte');
    }
  }

  Future<void> _toggleFlash() async {
    try {
      setState(() {
        isFlashOn = !isFlashOn;
      });
      await _cameraController.setFlashMode(
        isFlashOn ? FlashMode.torch : FlashMode.off,
      );
    } catch (e) {
      if(!mounted) return;
      ToastrService.error(context: context, message: 'Erro ao alternar o flash.');
    }
  }

  Future<void> _switchCamera() async {
    _currentCameraIndex = (_currentCameraIndex + 1) % widget.availableCameras.length;
    final CameraDescription selectedCamera = widget.availableCameras[_currentCameraIndex];

    await _cameraController.dispose();
    await _initializeCamera(selectedCamera);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  bool get isFrontCamera{
    return _cameraController.description.lensDirection == CameraLensDirection.front;
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraInitialized) return const LoadPage();
    return CameraControlButtonsWidget(
      onReturn: (){
        Modular.to.pop<List<File>>([]);
      },
      cameraAspectRatio: cameraAspectRatio,
      onConfirm: () {
        _cameraController.pausePreview()
          .then((_) => Modular.to.pop<List<File>>(_images));
      },
      images: _images,
      cameraPreview: CameraPreview(
          _cameraController
      ),
      onCaptureImage: _captureImage,
      onToggleFlash: _toggleFlash,
      onSwitchCamera: _switchCamera,
      isFlashOn: isFlashOn,
      isFrontCamera: isFrontCamera,
      loading: loading,
    );
  }
}