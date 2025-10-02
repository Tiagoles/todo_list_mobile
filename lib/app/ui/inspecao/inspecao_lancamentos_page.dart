import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/card_button/card_button_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/body_card.dart';
import 'package:smaservicos/app/ui/core/widgets/layouts/simple_bar_layout.dart';
import 'package:smaservicos/app/ui/core/widgets/menu/order_menu_dropdown/filter_menu_dropdown_options.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/inspecao_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/lancamentos/inspecao_lancamento_page_header.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/lancamentos/inspecao_lancamentos_body.dart';

class InspecaoLancamentosPage extends StatefulWidget {

  final InspecaoViewModel viewModel;

  const InspecaoLancamentosPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<InspecaoLancamentosPage> createState() => _InspecaoLancamentosPageState();
}

class _InspecaoLancamentosPageState extends State<InspecaoLancamentosPage> {

  FilterMenuDropdownOption filter = FilterMenuDropdownOption.todas;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      onRefresh: widget.viewModel.syncAllReleasesCommand.execute,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InspecaoLancamentoPageHeader(
            onDropdownChange: (value){
              setState(() {
                filter = FilterMenuDropdownOption.fromName(value);
              });
            },
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: BodyCard(
                child: InspecaoLancamentosBody(
                  viewmodel: widget.viewModel,
                  filter: filter,
                )
              ),
            ),
          ),
          CardButtonWidget(
            title: 'Página Inicial',
            onPressed: () => Modular.to.pushNamed('/home/'),
            icon: TablerIcons.home,
          )
        ],
      ),
    );
  }
}