import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/card_button/card_button_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/layouts/simple_bar_layout.dart';
import 'package:smaservicos/app/ui/core/widgets/menu/app_bar/home_app_bar/home_app_bar_widget.dart';
import 'package:smaservicos/app/ui/home/widgets/home_page_body.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';
import 'package:smaservicos/app/utils/home_error_message_map.dart';

class HomePage extends StatefulWidget {

  final Map<String, String>? queryParams;

  const HomePage({
    super.key,
    this.queryParams,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handlerError(Modular.args.queryParams);
    });
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

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: SimpleBarLayout(
      onRefresh: null,
      appBar: HomeAppBarWidget(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: HomePageBody(isLoading: false,)),
        ],
      ),
    ));
  }
}