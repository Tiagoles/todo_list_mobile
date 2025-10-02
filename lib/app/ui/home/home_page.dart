import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/card_button/card_button_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/layouts/simple_bar_layout.dart';
import 'package:smaservicos/app/ui/core/widgets/menu/app_bar/home_app_bar/home_app_bar_widget.dart';
import 'package:smaservicos/app/ui/home/widgets/home_page_body.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/inspecao_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/from_remote/inspecao_from_remote_viewmodel.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';
import 'package:smaservicos/app/utils/home_error_message_map.dart';

class HomePage extends StatefulWidget {

  final Map<String, String>? queryParams;
  final InspecaoViewModel viewModel;
  final InspecaoFromRemoteViewModel fromRemoteViewModel;

  const HomePage({
    super.key,
    this.queryParams,
    required this.viewModel,
    required this.fromRemoteViewModel,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    widget.fromRemoteViewModel.syncCommand.addListener(commandReaction);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handlerError(Modular.args.queryParams);
    });
  }

  @override
  void dispose() {
    widget.fromRemoteViewModel.syncCommand.removeListener(commandReaction);
    super.dispose();
  }

  void _handlerError(Map<String, String>? queryParams){
    if(!mounted) return;
    if(queryParams != null && queryParams.isNotEmpty){
      if(queryParams['error'] != null){
        final String error = homeErrorsMap[queryParams['error']!] ?? 'Erro desconhecido.';
        ToastrService.error(
          context: context,
          message: error,
        );
      }
    }
  }

  void commandReaction(){
    if(widget.fromRemoteViewModel.syncCommand.error){
      if(!mounted) return;
      final message = widget.fromRemoteViewModel.syncCommand.result?.exceptionOrNull()?.message;
      ToastrService.error(
        context: context,
        message: message ?? 'Erro ao sincronizar dados.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SimpleBarLayout(
      onRefresh: widget.fromRemoteViewModel.syncCommand.execute,
      appBar: const HomeAppBarWidget(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ListenableBuilder(
              listenable: widget.fromRemoteViewModel.syncCommand,
              builder: (context,child){
                return HomePageBody(
                  isLoading: widget.fromRemoteViewModel.syncCommand.running,
                  fromRemoteViewModel: widget.viewModel.fromRemoteViewModel,
                  onCardTapped: (inspecao) {
                    Modular.to.pushNamed('/inspecao/${inspecao.id}',);
                  },
                );
              }
          )),
          SizedBox(
            width: double.infinity,
            child: CardButtonWidget(
              title: 'Lançamentos',
              onPressed: () => Modular.to.pushNamed('/inspecao/lancamentos'),
              icon: TablerIcons.rocket,
              badgeText: (widget.viewModel.countReleases > 0 ? widget.viewModel.countReleases : null)?.toString()
            ),
          )
        ],
      ),
    ));
  }
}