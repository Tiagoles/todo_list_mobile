import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/domain/entities/inspecao_item/inspecao_item.dart';
import 'package:smaservicos/app/domain/models/inspecao_item/forms/inspecao_item_form_group.dart';
import 'package:smaservicos/app/ui/core/widgets/empty_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/ui/core/widgets/selects/select.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class FormInspecaoItensInspecionados extends StatefulWidget {
  final InspecaoItemFormGroup formGroup;

  const FormInspecaoItensInspecionados({super.key, required this.formGroup});

  @override
  State<FormInspecaoItensInspecionados> createState() => _FormInspecaoItensInspecionadosState();
}

class _FormInspecaoItensInspecionadosState extends State<FormInspecaoItensInspecionados> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final List<Option> _options = [
    Option(null, 'Selecione'),
    Option(1, 'Ok'),
    Option(2, 'Não Ok'),
  ];

  final _controller = FormControl.text(initialValue: null);
  final _filtro = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    _controller.valueNotifier.addListener(setFiltro);
  }

  void setFiltro(){
    _filtro.value = _controller.value.toLowerCase();
  }

  @override
  void dispose() {
    _controller.dispose();
    _filtro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 8,
        children: [
          StyledFormField(
            control: _controller,
            prefixIcon: TablerIcons.search,
            hintText: 'Procurar',
          ),
          Divider(color: context.colors.surfaceContainerHigh),
          Expanded(child: ValueListenableBuilder<String>(
            valueListenable: _filtro,
            builder: (context, filtro, child) {
              final filtrados = getItemsByFilter(filtro);

              if (filtrados.isEmpty) return const SingleChildScrollView(child:EmptyWidget());

              filtrados.sort((a, b) => a.dsItemInspecionado.compareTo(b.dsItemInspecionado));

              return ListView.separated(
                itemCount: filtrados.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final e = filtrados[index];
                  return Select(
                    placeholder: 'N/A',
                    label: formatedDescription(e),
                    options: _options,
                    formGroup: widget.formGroup,
                    name: e.cdItemInspecionado.toString(),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }

  ///Fiz isso porque o campo dsItemInspecionado estava vindo com um código na descrição que não correspondia ao código no banco de dados.
  String formatedDescription(InspecaoItem item) {
    return '${item.cdItemInspecionado} - ${item.dsItemInspecionado.split('-')[1]}';
  }

  List<InspecaoItem> getItemsByFilter(String filter) {
    if (filter.isEmpty) {
      return widget.formGroup.items;
    }
    return widget.formGroup.items.where((item) {
      return item.dsItemInspecionado.toLowerCase().contains(filter.toLowerCase()) ||
             item.cdItemInspecionado.toString().contains(filter);
    }).toList();
  }

}
