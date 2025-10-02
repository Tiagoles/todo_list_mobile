import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/body_card.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/order_card/order_card_skeleton.dart';
import 'package:smaservicos/app/ui/home/widgets/home_page_body_list.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/from_remote/inspecao_from_remote_viewmodel.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class HomePageBody extends StatelessWidget {
  final bool isLoading;
  final void Function(Inspecao) onCardTapped;
  final InspecaoFromRemoteViewModel fromRemoteViewModel;

  const HomePageBody({
    super.key,
    required this.onCardTapped,
    required this.isLoading,
    required this.fromRemoteViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return BodyCard(
        icon: TablerIcons.list_check,
        title: Text('Inspeções'.toUpperCase(), style: textTheme.titleMedium,),
        child: list
    );
  }
  
  Widget get list{
    if(isLoading) {
      return ListView.separated(
        itemCount: 6,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) => const OrderCardSkeleton(),
      );
    }
    return Observer(
      builder: (context){
        return HomePageBodyList(onCardTapped: onCardTapped, entities: fromRemoteViewModel.models);
      }
    );
  }
  
}
