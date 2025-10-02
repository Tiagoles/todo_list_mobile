import 'package:camera/camera.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/ui/camera/camera_page.dart';

class CameraModule extends Module {

  late final List<CameraDescription> cameras;

  CameraModule(){
    initModule();
  }

  Future<void> initModule() async {
    cameras = await availableCameras();
  }

  @override
  List<Module> get imports => [
    CoreModule()
  ];


  
  @override
  void binds(Injector i) {
    i.addLazySingleton(() {
      return CameraController(cameras[0], ResolutionPreset.high);
    });
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => CameraPage(
      availableCameras: cameras,
      cameraController: Modular.get(),
    ));
  }

}