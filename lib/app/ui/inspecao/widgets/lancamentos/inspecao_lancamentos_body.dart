import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/order_card/order_card_skeleton.dart';
import 'package:smaservicos/app/ui/core/widgets/empty_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/menu/order_menu_dropdown/filter_menu_dropdown_options.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/inspecao_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/lancamentos/sub_lists/inspecao_completing_list.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/lancamentos/sub_lists/inspecao_returning_list.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/lancamentos/sub_lists/inspecao_started_list.dart';

class InspecaoLancamentosBody extends StatefulWidget {

  final InspecaoViewModel viewmodel;
  final FilterMenuDropdownOption filter;

  const InspecaoLancamentosBody({
    super.key,
    required this.viewmodel,
    required this.filter,
  });

  @override
  State<InspecaoLancamentosBody> createState() => _InspecaoLancamentosBodyState();
}

class _InspecaoLancamentosBodyState extends State<InspecaoLancamentosBody> {

  @override
  Widget build(BuildContext context) {

    return ListenableBuilder(
      listenable: widget.viewmodel.syncAllReleasesCommand,
      builder:(context,_){
        final command = widget.viewmodel.syncAllReleasesCommand;
        if(command.running){
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(6, (index) => const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: OrderCardSkeleton(),
              )),
            ),
          );
        }
        return Observer(
          builder: (_){
            if(widget.viewmodel.countReleases == 0){
              return const EmptyWidget();
            }
            return CustomScrollView(
              slivers: [
                if([FilterMenuDropdownOption.todas, FilterMenuDropdownOption.iniciadas].contains(widget.filter))
                  InspecaoStartedList(viewmodel: widget.viewmodel.startedViewModel),
                if([FilterMenuDropdownOption.todas, FilterMenuDropdownOption.efetivando].contains(widget.filter))
                  InspecaoCompletingList(viewmodel: widget.viewmodel.completingViewModel),
                if([FilterMenuDropdownOption.todas, FilterMenuDropdownOption.retornando].contains(widget.filter))
                  InspecaoReturningList(viewmodel: widget.viewmodel.returningViewModel)
              ],
            );
          },
        );
      }
    );
  }
}
