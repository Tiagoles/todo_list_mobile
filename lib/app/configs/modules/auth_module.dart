import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/eletricista_module.dart';
import 'package:smaservicos/app/configs/modules/equipe_module.dart';
import 'package:smaservicos/app/data/repositories/auth/auth_repository.dart';
import 'package:smaservicos/app/data/repositories/auth/credentials_repository.dart';
import 'package:smaservicos/app/data/services/auth/auth_local_storage.dart';
import 'package:smaservicos/app/data/services/auth/authenticator.dart';
import 'package:smaservicos/app/data/services/auth/clients/auth_client_http.dart';
import 'package:smaservicos/app/data/services/auth/credentials_local_storage.dart';
import 'package:smaservicos/app/data/services/core/clients/dio_client.dart';
import 'package:smaservicos/app/data/services/core/local_storage/secure_storage.dart';
import 'package:smaservicos/app/ui/auth/login_page.dart';
import 'package:smaservicos/app/ui/auth/logout_page.dart';
import 'package:smaservicos/app/ui/auth/viewmodels/auth_viewmodel/auth_viewmodel.dart';
import 'package:smaservicos/app/ui/auth/viewmodels/login_viewmodel/login_viewmodel.dart';
import 'package:smaservicos/app/utils/auto_dispose.dart';

import 'core_module.dart';

class AuthModule extends Module {

  @override
  List<Module> get imports => [
    CoreModule(),
    EletricistaModule(),
    EquipeModule()
  ];

  @override
  void exportedBinds(Injector i) {
    i.add<DioClient>(AuthClientHttp.new, key: 'auth_client');

    i.addSingleton<AuthRepository>(
      AuthRepository.new,
      config: autoDisposeConfig(),
    );

    i.addSingleton<CredentialsRepository>(
  CredentialsRepository.new,
      config: autoDisposeConfig()
    );

    i.addSingleton(AuthViewModel.new);

    i.add<LoginViewModel>(
    LoginViewModel.new,
      config: autoDisposeConfig(),
    );

  }

  @override
  void binds(Injector i) {
    i.add(() => AuthLocalStorage(i.get<SecureStorage>()));
    i.add(() => CredentialsLocalStorage(i.get<SecureStorage>()));
    i.add(() => Authenticator(i.get(key: 'client_http')));
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/login',
      child:
          (context) => LoginPage(viewModel: Modular.get(), args: r.args.data),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      '/logout',
      child:
          (context) => LogoutPage(
            viewModel: Modular.get(),
            args: r.args.data,
            queryString: r.args.queryParams,
          ),
    );
  }
}
